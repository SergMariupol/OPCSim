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
        Peaks
    };
    Q_ENUM(SimulationType)

    struct SimulationConfig {
        SimulationType type = SimulationType::Sine;
        double amplitude = 1.0;
        double frequency = 0.1;
        double noiseAmplitude = 0.05;
        int peakInterval = 60;
        double peakBase = 0.1;
        double peakHeight = 1.0;
        double peakWidthRatio = 0.1;
    };

    explicit DataSimulationServer(QObject *parent = nullptr);
    ~DataSimulationServer();

    bool init();
    void launch();
    bool isRunning() const;

    int valueCount() const;
    QString displayName(int index) const;
    SimulationType simulationType(int index) const;

signals:
    void runningChanged(bool running);
    void errorOccurred(const QString &message);

    int valueCount() const;
    QString displayName(int index) const;
    SimulationType simulationType(int index) const;

public slots:
    void processServerEvents();
    void updateSimulation();
    void shutdown();
    void setSimulationType(int index, SimulationType type);

private:
    bool setupAddressSpace();

    UA_Server *m_server = nullptr;
    QAtomicInt m_running{false};
    QTimer m_iterateTimer;
    QTimer m_updateTimer;
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
