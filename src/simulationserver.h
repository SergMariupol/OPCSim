#ifndef DATASIMULATIONSERVER_H
#define DATASIMULATIONSERVER_H

#ifdef USE_SYSTEM_OPEN62541
#include <open62541/server.h>
#include <open62541/server_config_default.h>
#else
// подключаем амальгамацию напрямую из 3rdparty
#include "open62541.h"
#endif

#include <QtCore/QAtomicInt>
#include <QtCore/QObject>
#include <QtCore/QString>
#include <QtCore/QStringList>
#include <QtCore/QTimer>
#include <QtCore/QVector>

QT_BEGIN_NAMESPACE

class DataSimulationServer : public QObject
{
    Q_OBJECT
public:
    enum class SimulationType {
        Sine,
        Peaks,
        Manual
    };
    Q_ENUM(SimulationType)

    struct SimulationConfig {
        SimulationType type = SimulationType::Sine;
        double sineMin = -1.0;
        double sineMax = 1.0;
        double sinePeriod = 60.0;
        double noiseAmplitude = 0.05;
        double peakPeriod = 60.0;
        double peakMin = 0.1;
        double peakMax = 1.0;
        double peakWidthRatio = 0.1;
        double manualValue = 0.0;
    };

    explicit DataSimulationServer(QObject *parent = nullptr);
    ~DataSimulationServer();

    bool init();
    void launch();
    bool isRunning() const;

    int valueCount() const;
    QString displayName(int index) const;
    SimulationType simulationType(int index) const;
    double currentValue(int index) const;
    double sineMinimum(int index) const;
    double sineMaximum(int index) const;
    double sinePeriod(int index) const;
    double peakMinimum(int index) const;
    double peakMaximum(int index) const;
    double peakPeriod(int index) const;
    double minimumValue(int index) const;
    double defaultPeriod(int index) const;

signals:
    void runningChanged(bool running);
    void errorOccurred(const QString &message);
    void valueChanged(int index, double value);

public slots:
    void processServerEvents();
    void updateSimulation();
    void shutdown();
    void setSimulationType(int index, SimulationType type);
    void setManualValue(int index, double value);
    void setSineMinimum(int index, double value);
    void setSineMaximum(int index, double value);
    void setSinePeriod(int index, double value);
    void setPeakMinimum(int index, double value);
    void setPeakMaximum(int index, double value);
    void setPeakPeriod(int index, double value);
    void resetValueToMinimum(int index);
    void resetPeriod(int index);

private:
    bool setupAddressSpace();
    void loadSettings();
    void saveSettings() const;
    void scheduleSettingsSave();
    void writeValue(int index, double value);

    UA_Server *m_server = nullptr;
    QAtomicInt m_running{false};
    QTimer m_iterateTimer;
    QTimer m_updateTimer;
    QTimer m_settingsSaveTimer;
    QVector<UA_NodeId> m_valueNodes;
    QVector<double> m_currentValues;
    QVector<SimulationConfig> m_simulationConfigs;
    QStringList m_displayNames;
    quint16 m_namespaceIndex = 0;
    UA_NodeId m_folderNode;
    quint64 m_stepCounter = 0;
};

QT_END_NAMESPACE

#endif // DATASIMULATIONSERVER_H
