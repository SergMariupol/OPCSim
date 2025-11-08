#ifndef DATASIMULATIONSERVER_H
#define DATASIMULATIONSERVER_H

#ifdef USE_SYSTEM_OPEN62541
#include <open62541/server.h>
#include <open62541/server_config_default.h>
#else
#include <qopen62541.h>
#endif

#include <QtCore/QAtomicInt>
#include <QtCore/QObject>
#include <QtCore/QTimer>
#include <QtCore/QVector>

QT_BEGIN_NAMESPACE

class DataSimulationServer : public QObject
{
    Q_OBJECT
public:
    explicit DataSimulationServer(QObject *parent = nullptr);
    ~DataSimulationServer();

    bool init();
    void launch();

public slots:
    void processServerEvents();
    void updateSimulation();
    void shutdown();

private:
    bool setupAddressSpace();

    UA_Server *m_server = nullptr;
    QAtomicInt m_running{false};
    QTimer m_iterateTimer;
    QTimer m_updateTimer;
    QVector<UA_NodeId> m_valueNodes;
    QVector<double> m_currentValues;
    quint16 m_namespaceIndex = 0;
    UA_NodeId m_folderNode;
    quint64 m_stepCounter = 0;
};

QT_END_NAMESPACE

#endif // DATASIMULATIONSERVER_H
