#include "controlwindow.h"
#include "simulationserver.h"

#include <QtCore/QCoreApplication>
#include <QtCore/QDebug>
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

    DataSimulationServer server;
    if (!server.init()) {
        qCritical() << "Could not initialize server.";
        return EXIT_FAILURE;
    }

    server.launch();

    ControlWindow window(&server);
    window.show();

    return app.exec();
}
