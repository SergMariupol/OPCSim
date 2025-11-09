#include "simulationserver.h"

#include <QtCore/QByteArray>
#include <QtCore/QLoggingCategory>
#include <QtCore/QRandomGenerator>

#include <cmath>

QT_BEGIN_NAMESPACE

Q_LOGGING_CATEGORY(lcDataSimulation, "qt.opcua.datasimulation")

namespace {
constexpr quint16 kValueCount = 100;
constexpr int kUpdateIntervalMs = 100;
constexpr double kFrequencyBase = 0.1;
}

DataSimulationServer::DataSimulationServer(QObject *parent)
    : QObject(parent)
{
    UA_NodeId_init(&m_folderNode);

    m_iterateTimer.setInterval(5);
    m_iterateTimer.setSingleShot(false);
    m_updateTimer.setInterval(kUpdateIntervalMs);
    m_updateTimer.setSingleShot(false);

    connect(&m_iterateTimer, &QTimer::timeout, this, &DataSimulationServer::processServerEvents);
    connect(&m_updateTimer, &QTimer::timeout, this, &DataSimulationServer::updateSimulation);
}

DataSimulationServer::~DataSimulationServer()
{
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

    return setupAddressSpace();
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

    for (quint16 i = 0; i < kValueCount; ++i) {
        const double initialValue = std::sin((i + 1) * kFrequencyBase);
        m_currentValues[i] = initialValue;

        UA_VariableAttributes attr = UA_VariableAttributes_default;
        UA_Variant_setScalarCopy(&attr.value, &m_currentValues[i], &UA_TYPES[UA_TYPES_DOUBLE]);
        const QByteArray displayName = QByteArray("Value ") + QByteArray::number(i + 1);
        attr.displayName = UA_LOCALIZEDTEXT_ALLOC("en-US", displayName.constData());
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

    UA_StatusCode status = UA_Server_run_startup(m_server);
    if (status != UA_STATUSCODE_GOOD) {
        qCWarning(lcDataSimulation) << "Could not start server" << status;
        return;
    }

    m_running = true;
    m_iterateTimer.start();
    m_updateTimer.start();
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
        const double noise   = QRandomGenerator::global()->generateDouble() * 0.05;
        const double signal  = std::sin((m_stepCounter * kFrequencyBase) + (i * 0.05));
        m_currentValues[i]   = signal + noise;

        UA_DataValue dv;
        UA_DataValue_init(&dv);

        // Значение — копией внутрь dv.value (никаких висячих указателей)
        UA_Variant_setScalarCopy(&dv.value, &m_currentValues[i], &UA_TYPES[UA_TYPES_DOUBLE]);

        // Ваш источник времени (UTC)
        dv.hasSourceTimestamp = true;
        dv.sourceTimestamp    = UA_DateTime_now();

        // Опционально — зафиксировать и ServerTimestamp тем же значением:
        // dv.hasServerTimestamp = true;
        // dv.serverTimestamp    = now;

        const UA_StatusCode st = UA_Server_writeDataValue(m_server, m_valueNodes[i], dv);
        if (st != UA_STATUSCODE_GOOD) {
            qCWarning(lcDataSimulation) << "write failed for node" << i << "status:" << st;
        }

        UA_DataValue_clear(&dv);
    }
}

void DataSimulationServer::shutdown()
{
    if (m_running) {
        m_iterateTimer.stop();
        m_updateTimer.stop();
        UA_Server_run_shutdown(m_server);
        m_running = false;
    }
}

QT_END_NAMESPACE
