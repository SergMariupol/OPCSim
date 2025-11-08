#include "simulationserver.h"

#include <QtCore/QCoreApplication>
#include <QtCore/QDebug>

#include <csignal>

int main(int argc, char **argv)
{
#ifdef Q_OS_MACOS
    signal(SIGPIPE, SIG_IGN);
#endif

    QCoreApplication app(argc, argv);

    DataSimulationServer server;
    if (!server.init()) {
        qCritical() << "Could not initialize server.";
        return EXIT_FAILURE;
    }

    server.launch();

    return app.exec();
}
