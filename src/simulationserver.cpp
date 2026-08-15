#include "simulationserver.h"

#include <QtCore/QByteArray>
#include <QtCore/QCoreApplication>
#include <QtCore/QDir>
#include <QtCore/QLoggingCategory>
#include <QtCore/QSettings>

#include <algorithm>
#include <cmath>

QT_BEGIN_NAMESPACE

Q_LOGGING_CATEGORY(lcDataSimulation, "qt.opcua.datasimulation")

namespace {
constexpr quint16 kValueCount = 100;
constexpr int kUpdateIntervalMs = 100;
constexpr double kMinPeriod = 1.0;
constexpr double kMaxPeriod = 1000000.0;
constexpr double kPi = 3.14159265358979323846;
constexpr double kValueRoundingFactor = 1000.0; // три знака после запятой

double defaultSinePeriod(int index)
{
    return 60.0 + (index % 6) * 5.0;
}

double defaultPeakPeriod(int index)
{
    return 60.0 + (index % 10) * 5.0;
}

QString settingsDirectoryPath()
{
    const QDir applicationDir(QCoreApplication::applicationDirPath());
    if (applicationDir.dirName().compare(QStringLiteral("build"), Qt::CaseInsensitive) == 0)
        return applicationDir.absolutePath();

    QDir currentDir(QDir::currentPath());
    if (currentDir.dirName().compare(QStringLiteral("build"), Qt::CaseInsensitive) == 0)
        return currentDir.absolutePath();

    if (currentDir.exists(QStringLiteral("build")) || currentDir.mkdir(QStringLiteral("build")))
        return currentDir.absoluteFilePath(QStringLiteral("build"));

    return applicationDir.absolutePath();
}

QString settingsFilePath()
{
    return QDir(settingsDirectoryPath()).absoluteFilePath(QStringLiteral("datasimulation.ini"));
}
}

DataSimulationServer::DataSimulationServer(QObject *parent)
    : QObject(parent)
{
    UA_NodeId_init(&m_folderNode);

    // Таймеры должны стать потомками объекта, иначе moveToThread() оставит их
    // в исходном потоке и start() из потока сервера завершится ошибкой.
    m_iterateTimer.setParent(this);
    m_updateTimer.setParent(this);
    m_settingsSaveTimer.setParent(this);

    m_iterateTimer.setInterval(5);
    m_iterateTimer.setSingleShot(false);
    m_updateTimer.setInterval(kUpdateIntervalMs);
    m_updateTimer.setSingleShot(false);
    m_settingsSaveTimer.setInterval(250);
    m_settingsSaveTimer.setSingleShot(true);

    connect(&m_iterateTimer, &QTimer::timeout, this, &DataSimulationServer::processServerEvents);
    connect(&m_updateTimer, &QTimer::timeout, this, &DataSimulationServer::updateSimulation);
    connect(&m_settingsSaveTimer, &QTimer::timeout, this, &DataSimulationServer::saveSettings);
}

DataSimulationServer::~DataSimulationServer()
{
    m_settingsSaveTimer.stop();
    saveSettings();
    shutdown();

    for (UA_NodeId &nodeId : m_valueNodes)
        UA_NodeId_clear(&nodeId);
    m_valueNodes.clear();

    if (!UA_NodeId_isNull(&m_folderNode))
        UA_NodeId_clear(&m_folderNode);

    if (m_server)
        UA_Server_delete(m_server);
}

bool DataSimulationServer::init()
{
    m_server = UA_Server_new();
    if (!m_server)
        return false;

    UA_ServerConfig *config = UA_Server_getConfig(m_server);
    UA_StatusCode status = UA_ServerConfig_setMinimal(config, 4850, nullptr);
    if (status != UA_STATUSCODE_GOOD)
        return false;

    config->tcpReuseAddr = true;

    if (!setupAddressSpace())
        return false;

    loadSettings();
    return true;
}

bool DataSimulationServer::setupAddressSpace()
{
    m_namespaceIndex = UA_Server_addNamespace(m_server, "DataSimulation");

    UA_ObjectAttributes objAttr = UA_ObjectAttributes_default;
    objAttr.displayName = UA_LOCALIZEDTEXT("en-US", "SimulatedValues");

    UA_StatusCode status = UA_Server_addObjectNode(
                m_server,
                UA_NODEID_NULL,
                UA_NODEID_NUMERIC(0, UA_NS0ID_OBJECTSFOLDER),
                UA_NODEID_NUMERIC(0, UA_NS0ID_ORGANIZES),
                UA_QUALIFIEDNAME(m_namespaceIndex, "SimulatedValues"),
                UA_NODEID_NUMERIC(0, UA_NS0ID_FOLDERTYPE),
                objAttr,
                nullptr,
                &m_folderNode);

    if (status != UA_STATUSCODE_GOOD)
        return false;

    m_valueNodes.reserve(kValueCount);
    m_currentValues.resize(kValueCount);
    m_simulationConfigs.resize(kValueCount);
    m_displayNames.reserve(kValueCount);

    for (quint16 i = 0; i < kValueCount; ++i) {
        SimulationConfig &config = m_simulationConfigs[i];
        config.sineMin = -1.0;
        config.sineMax = 1.0;
        config.sinePeriod = defaultSinePeriod(i);
        config.peakPeriod = defaultPeakPeriod(i);
        config.peakMax = 1.0 + (i % 5) * 0.1;
        config.peakMin = 0.1;
        config.peakWidthRatio = 0.08;

        const QString displayName = QStringLiteral("Value %1").arg(i + 1);
        m_displayNames.append(displayName);

        const double amplitude = (config.sineMax - config.sineMin) / 2.0;
        const double center = (config.sineMax + config.sineMin) / 2.0;
        const double initialValue = center - amplitude;
        m_currentValues[i] = initialValue;

        UA_VariableAttributes attr = UA_VariableAttributes_default;
        UA_Variant_setScalarCopy(&attr.value, &m_currentValues[i], &UA_TYPES[UA_TYPES_DOUBLE]);
        const QByteArray displayNameUtf8 = displayName.toUtf8();
        attr.displayName = UA_LOCALIZEDTEXT_ALLOC("en-US", displayNameUtf8.constData());
        attr.dataType = UA_TYPES[UA_TYPES_DOUBLE].typeId;
        attr.accessLevel = UA_ACCESSLEVELMASK_READ | UA_ACCESSLEVELMASK_WRITE;

        UA_NodeId nodeId;
        const QByteArray browseName = QByteArray("Value") + QByteArray::number(i + 1);
        UA_QualifiedName qualifiedName =
                UA_QUALIFIEDNAME_ALLOC(m_namespaceIndex, browseName.constData());
        status = UA_Server_addVariableNode(
                    m_server,
                    UA_NODEID_NULL,
                    m_folderNode,
                    UA_NODEID_NUMERIC(0, UA_NS0ID_HASCOMPONENT),
                    qualifiedName,
                    UA_NODEID_NUMERIC(0, UA_NS0ID_BASEDATAVARIABLETYPE),
                    attr,
                    nullptr,
                    &nodeId);

        UA_VariableAttributes_clear(&attr);
        UA_QualifiedName_clear(&qualifiedName);

        if (status != UA_STATUSCODE_GOOD)
            return false;

        m_valueNodes.append(nodeId);
    }

    return true;
}

void DataSimulationServer::launch()
{
    if (m_running)
        return;

    if (!m_server) {
        emit errorOccurred(tr("Сервер не инициализирован."));
        return;
    }

    UA_StatusCode status = UA_Server_run_startup(m_server);
    if (status != UA_STATUSCODE_GOOD) {
        qCWarning(lcDataSimulation) << "Could not start server" << status;
        emit errorOccurred(tr("Не удалось запустить сервер (код %1)").arg(status));
        return;
    }

    m_running = true;
    m_iterateTimer.start();
    m_updateTimer.start();

    emit errorOccurred(QString());
    emit runningChanged(true);
}

void DataSimulationServer::processServerEvents()
{
    if (m_running)
        UA_Server_run_iterate(m_server, false);
}

void DataSimulationServer::updateSimulation()
{
    if (!m_running)
        return;

    ++m_stepCounter;

    for (int i = 0; i < m_valueNodes.size(); ++i) {
        SimulationConfig config;
        {
            QMutexLocker locker(&m_dataMutex);
            config = m_simulationConfigs.at(i);
        }

        double signal = 0.0;
        double noise = 0.0;
        switch (config.type) {
        case SimulationType::Sine:
            {
            const double minValue = std::min(config.sineMin, config.sineMax);
            const double maxValue = std::max(config.sineMin, config.sineMax);
            const double amplitude = (maxValue - minValue) / 2.0;
            const double center = (maxValue + minValue) / 2.0;
            const double period = std::clamp(config.sinePeriod, kMinPeriod, kMaxPeriod);
            const double elapsedSeconds = (m_stepCounter * kUpdateIntervalMs) / 1000.0;
            const double phase = (elapsedSeconds / period) * 2.0 * kPi;
            signal = center - amplitude * std::cos(phase);
            }
            break;
        case SimulationType::Peaks: {
            const double period = std::clamp(config.peakPeriod, kMinPeriod, kMaxPeriod);
            const double elapsedSeconds = (m_stepCounter * kUpdateIntervalMs) / 1000.0;
            const double position = std::fmod(elapsedSeconds, period) / period;
            const double width = std::clamp(config.peakWidthRatio, 0.01, 0.5);
            const double minValue = std::min(config.peakMin, config.peakMax);
            const double maxValue = std::max(config.peakMin, config.peakMax);
            signal = position < width ? maxValue : minValue;
            break;
        }
        case SimulationType::Manual:
            signal = config.manualValue;
            break;
        }

        writeValue(i, signal + noise);
    }
}

void DataSimulationServer::shutdown()
{
    if (m_running) {
        m_iterateTimer.stop();
        m_updateTimer.stop();
        UA_Server_run_shutdown(m_server);
        m_running = false;
        emit runningChanged(false);
    }
}

bool DataSimulationServer::isRunning() const
{
    return m_running != 0;
}

int DataSimulationServer::valueCount() const
{
    return m_valueNodes.size();
}

QString DataSimulationServer::displayName(int index) const
{
    if (index < 0 || index >= m_displayNames.size())
        return QString();
    return m_displayNames.at(index);
}

DataSimulationServer::SimulationType DataSimulationServer::simulationType(int index) const
{
    QMutexLocker locker(&m_dataMutex);
    if (index < 0 || index >= m_simulationConfigs.size())
        return SimulationType::Sine;
    return m_simulationConfigs.at(index).type;
}

double DataSimulationServer::currentValue(int index) const
{
    QMutexLocker locker(&m_dataMutex);
    if (index < 0 || index >= m_currentValues.size())
        return 0.0;
    return m_currentValues.at(index);
}

QVector<double> DataSimulationServer::currentValues() const
{
    QMutexLocker locker(&m_dataMutex);
    return m_currentValues;
}

double DataSimulationServer::sineMinimum(int index) const
{
    QMutexLocker locker(&m_dataMutex);
    if (index < 0 || index >= m_simulationConfigs.size())
        return -1.0;
    return m_simulationConfigs.at(index).sineMin;
}

double DataSimulationServer::sineMaximum(int index) const
{
    QMutexLocker locker(&m_dataMutex);
    if (index < 0 || index >= m_simulationConfigs.size())
        return 1.0;
    return m_simulationConfigs.at(index).sineMax;
}

double DataSimulationServer::sinePeriod(int index) const
{
    QMutexLocker locker(&m_dataMutex);
    if (index < 0 || index >= m_simulationConfigs.size())
        return 60.0;
    return m_simulationConfigs.at(index).sinePeriod;
}

double DataSimulationServer::peakMinimum(int index) const
{
    QMutexLocker locker(&m_dataMutex);
    if (index < 0 || index >= m_simulationConfigs.size())
        return 0.0;
    return m_simulationConfigs.at(index).peakMin;
}

double DataSimulationServer::peakMaximum(int index) const
{
    QMutexLocker locker(&m_dataMutex);
    if (index < 0 || index >= m_simulationConfigs.size())
        return 1.0;
    return m_simulationConfigs.at(index).peakMax;
}

double DataSimulationServer::peakPeriod(int index) const
{
    QMutexLocker locker(&m_dataMutex);
    if (index < 0 || index >= m_simulationConfigs.size())
        return 60.0;
    return m_simulationConfigs.at(index).peakPeriod;
}

double DataSimulationServer::minimumValue(int index) const
{
    QMutexLocker locker(&m_dataMutex);
    if (index < 0 || index >= m_simulationConfigs.size())
        return 0.0;

    const SimulationConfig &config = m_simulationConfigs.at(index);
    if (config.type == SimulationType::Peaks)
        return std::min(config.peakMin, config.peakMax);
    if (config.type == SimulationType::Manual)
        return config.manualValue;
    return std::min(config.sineMin, config.sineMax);
}

double DataSimulationServer::defaultPeriod(int index) const
{
    QMutexLocker locker(&m_dataMutex);
    if (index < 0 || index >= m_simulationConfigs.size())
        return 60.0;

    const SimulationConfig &config = m_simulationConfigs.at(index);
    if (config.type == SimulationType::Peaks)
        return defaultPeakPeriod(index);
    return defaultSinePeriod(index);
}

void DataSimulationServer::setSimulationType(int index, SimulationType type)
{
    {
        QMutexLocker locker(&m_dataMutex);
        if (index < 0 || index >= m_simulationConfigs.size())
            return;

        SimulationConfig &config = m_simulationConfigs[index];
        config.type = type;

        if (type == SimulationType::Sine) {
            config.noiseAmplitude = 0.05;
        } else if (type == SimulationType::Peaks) {
            config.peakWidthRatio = 0.08;
            config.noiseAmplitude = 0.02;
        } else if (type == SimulationType::Manual) {
            config.manualValue = m_currentValues.value(index, 0.0);
            config.noiseAmplitude = 0.0;
        }
    }

    scheduleSettingsSave();
}

void DataSimulationServer::setManualValue(int index, double value)
{
    {
        QMutexLocker locker(&m_dataMutex);
        if (index < 0 || index >= m_simulationConfigs.size())
            return;

        m_simulationConfigs[index].manualValue = value;
    }

    writeValue(index, value);
    scheduleSettingsSave();
}

void DataSimulationServer::setSineMinimum(int index, double value)
{
    {
        QMutexLocker locker(&m_dataMutex);
        if (index < 0 || index >= m_simulationConfigs.size())
            return;

        m_simulationConfigs[index].sineMin = value;
    }

    scheduleSettingsSave();
}

void DataSimulationServer::setSineMaximum(int index, double value)
{
    {
        QMutexLocker locker(&m_dataMutex);
        if (index < 0 || index >= m_simulationConfigs.size())
            return;

        m_simulationConfigs[index].sineMax = value;
    }

    scheduleSettingsSave();
}

void DataSimulationServer::setSinePeriod(int index, double value)
{
    {
        QMutexLocker locker(&m_dataMutex);
        if (index < 0 || index >= m_simulationConfigs.size())
            return;

        m_simulationConfigs[index].sinePeriod = value;
    }

    scheduleSettingsSave();
}

void DataSimulationServer::setPeakMinimum(int index, double value)
{
    {
        QMutexLocker locker(&m_dataMutex);
        if (index < 0 || index >= m_simulationConfigs.size())
            return;

        m_simulationConfigs[index].peakMin = value;
    }

    scheduleSettingsSave();
}

void DataSimulationServer::setPeakMaximum(int index, double value)
{
    {
        QMutexLocker locker(&m_dataMutex);
        if (index < 0 || index >= m_simulationConfigs.size())
            return;

        m_simulationConfigs[index].peakMax = value;
    }

    scheduleSettingsSave();
}

void DataSimulationServer::setPeakPeriod(int index, double value)
{
    {
        QMutexLocker locker(&m_dataMutex);
        if (index < 0 || index >= m_simulationConfigs.size())
            return;

        m_simulationConfigs[index].peakPeriod = value;
    }

    scheduleSettingsSave();
}

void DataSimulationServer::resetValueToMinimum(int index)
{
    const double value = minimumValue(index);
    bool isManual = false;
    {
        QMutexLocker locker(&m_dataMutex);
        if (index < 0 || index >= m_simulationConfigs.size())
            return;

        isManual = m_simulationConfigs[index].type == SimulationType::Manual;
        if (isManual)
            m_simulationConfigs[index].manualValue = value;
    }

    if (isManual)
        scheduleSettingsSave();
    writeValue(index, value);
}

void DataSimulationServer::resetPeriod(int index)
{
    {
        QMutexLocker locker(&m_dataMutex);
        if (index < 0 || index >= m_simulationConfigs.size())
            return;

        SimulationConfig &config = m_simulationConfigs[index];
        if (config.type == SimulationType::Peaks) {
            config.peakPeriod = defaultPeakPeriod(index);
        } else if (config.type == SimulationType::Sine) {
            config.sinePeriod = defaultSinePeriod(index);
        }
    }

    scheduleSettingsSave();
}

void DataSimulationServer::loadSettings()
{
    QSettings settings(settingsFilePath(), QSettings::IniFormat);
    settings.beginGroup(QStringLiteral("datasimulation"));

    const int count = m_simulationConfigs.size();
    for (int i = 0; i < count; ++i) {
        SimulationConfig defaults;
        {
            QMutexLocker locker(&m_dataMutex);
            defaults = m_simulationConfigs.at(i);
        }

        settings.beginGroup(QStringLiteral("value%1").arg(i));
        const int typeValue = settings.value(QStringLiteral("type"),
                                             static_cast<int>(defaults.type)).toInt();
        const double manualValue = settings.value(QStringLiteral("manualValue"),
                                                  defaults.manualValue).toDouble();
        const double sineMin = settings.value(QStringLiteral("sineMin"),
                                              defaults.sineMin).toDouble();
        const double sineMax = settings.value(QStringLiteral("sineMax"),
                                              defaults.sineMax).toDouble();
        const double sinePeriod = settings.value(QStringLiteral("sinePeriod"),
                                                 defaults.sinePeriod).toDouble();
        const double peakMin = settings.value(QStringLiteral("peakMin"),
                                              defaults.peakMin).toDouble();
        const double peakMax = settings.value(QStringLiteral("peakMax"),
                                              defaults.peakMax).toDouble();
        const double peakPeriod = settings.value(QStringLiteral("peakPeriod"),
                                                 defaults.peakPeriod).toDouble();
        settings.endGroup();

        SimulationType type = SimulationType::Sine;
        if (typeValue >= static_cast<int>(SimulationType::Sine)
                && typeValue <= static_cast<int>(SimulationType::Manual)) {
            type = static_cast<SimulationType>(typeValue);
        }

        setSimulationType(i, type);
        {
            QMutexLocker locker(&m_dataMutex);
            SimulationConfig &config = m_simulationConfigs[i];
            config.manualValue = manualValue;
            config.sineMin = sineMin;
            config.sineMax = sineMax;
            config.sinePeriod = sinePeriod;
            config.peakMin = peakMin;
            config.peakMax = peakMax;
            config.peakPeriod = peakPeriod;
        }
        if (type == SimulationType::Manual)
            setManualValue(i, manualValue);
    }

    settings.endGroup();
}

void DataSimulationServer::scheduleSettingsSave()
{
    if (m_settingsSaveTimer.isActive())
        m_settingsSaveTimer.stop();
    m_settingsSaveTimer.start();
}

void DataSimulationServer::saveSettings() const
{
    // Снимок под мьютексом, чтобы не держать блокировку на время записи файла.
    QVector<SimulationConfig> configs;
    {
        QMutexLocker locker(&m_dataMutex);
        configs = m_simulationConfigs;
    }

    QSettings settings(settingsFilePath(), QSettings::IniFormat);
    settings.beginGroup(QStringLiteral("datasimulation"));
    settings.setValue(QStringLiteral("valueCount"), configs.size());

    for (int i = 0; i < configs.size(); ++i) {
        settings.beginGroup(QStringLiteral("value%1").arg(i));
        settings.setValue(QStringLiteral("type"), static_cast<int>(configs[i].type));
        settings.setValue(QStringLiteral("manualValue"), configs[i].manualValue);
        settings.setValue(QStringLiteral("sineMin"), configs[i].sineMin);
        settings.setValue(QStringLiteral("sineMax"), configs[i].sineMax);
        settings.setValue(QStringLiteral("sinePeriod"), configs[i].sinePeriod);
        settings.setValue(QStringLiteral("peakMin"), configs[i].peakMin);
        settings.setValue(QStringLiteral("peakMax"), configs[i].peakMax);
        settings.setValue(QStringLiteral("peakPeriod"), configs[i].peakPeriod);
        settings.endGroup();
    }

    settings.endGroup();
    settings.sync();
}

void DataSimulationServer::writeValue(int index, double value)
{
    if (index < 0 || index >= m_valueNodes.size())
        return;

    const double roundedValue = std::round(value * kValueRoundingFactor) / kValueRoundingFactor;
    {
        QMutexLocker locker(&m_dataMutex);
        m_currentValues[index] = roundedValue;
    }
    emit valueChanged(index, roundedValue);

    if (!m_running || !m_server)
        return;

    UA_DataValue dv;
    UA_DataValue_init(&dv);

    UA_Variant_setScalarCopy(&dv.value, &roundedValue, &UA_TYPES[UA_TYPES_DOUBLE]);

    dv.hasSourceTimestamp = true;
    dv.sourceTimestamp    = UA_DateTime_now();

    const UA_StatusCode st = UA_Server_writeDataValue(m_server, m_valueNodes[index], dv);
    if (st != UA_STATUSCODE_GOOD) {
        qCWarning(lcDataSimulation) << "write failed for node" << index << "status:" << st;
    }

    UA_DataValue_clear(&dv);
}

QT_END_NAMESPACE
