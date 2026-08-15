#include "controlwindow.h"
#include "simulationserver.h"

#include <QtCore/QCoreApplication>
#include <QtCore/QDebug>
#include <QtCore/QThread>
#include <QtWidgets/QApplication>

#include <csignal>

int main(int argc, char **argv)
{
#ifdef Q_OS_MACOS
    signal(SIGPIPE, SIG_IGN);
#endif

    QApplication app(argc, argv);
    QCoreApplication::setOrganizationName(QStringLiteral("QtOpcUaExamples"));
    QCoreApplication::setApplicationName(QStringLiteral("DataSimulation"));

    // Сервер живёт в отдельном потоке, чтобы перерисовка таблицы не задерживала
    // UA_Server_run_iterate() и публикацию уведомлений подписчикам.
    QThread serverThread;
    serverThread.setObjectName(QStringLiteral("OpcUaServer"));

    auto *server = new DataSimulationServer;
    server->moveToThread(&serverThread);
    // Уничтожение тоже должно произойти в потоке сервера: деструктор дергает
    // UA_Server_delete(), а open62541 собран без поддержки многопоточности.
    QObject::connect(&serverThread, &QThread::finished, server, &QObject::deleteLater);
    serverThread.start();

    // init() создаёт адресное пространство, поэтому окно строится после него.
    bool initialized = false;
    QMetaObject::invokeMethod(server, [server, &initialized]() {
        initialized = server->init();
    }, Qt::BlockingQueuedConnection);

    if (!initialized) {
        qCritical() << "Could not initialize server.";
        serverThread.quit();
        serverThread.wait();
        return EXIT_FAILURE;
    }

    ControlWindow window(server);
    window.show();

    // Запуск после показа окна, иначе runningChanged()/errorOccurred() уйдут в никуда.
    QMetaObject::invokeMethod(server, [server]() { server->launch(); }, Qt::QueuedConnection);

    const int result = app.exec();

    serverThread.quit();
    serverThread.wait();

    return result;
}
