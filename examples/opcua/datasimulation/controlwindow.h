#ifndef CONTROLWINDOW_H
#define CONTROLWINDOW_H

#include <QtCore/QString>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class QComboBox;
class QTableWidget;
class QPushButton;
class QCloseEvent;
class QLabel;
class DataSimulationServer;

class ControlWindow : public QWidget
{
    Q_OBJECT
public:
    explicit ControlWindow(DataSimulationServer *server, QWidget *parent = nullptr);

protected:
    void closeEvent(QCloseEvent *event) override;

private:
    enum class ServerState {
        Stopped,
        Running,
        Error
    };

    void populateTable();
    void setupConnections();
    void handleTypeChange(int row, int comboIndex);
    void updateStatusIndicator(ServerState state, const QString &message = QString());

    DataSimulationServer *m_server = nullptr;
    QTableWidget *m_table = nullptr;
    QPushButton *m_startButton = nullptr;
    QPushButton *m_stopButton = nullptr;
    QPushButton *m_closeButton = nullptr;
    QLabel *m_statusLabel = nullptr;
};

QT_END_NAMESPACE

#endif // CONTROLWINDOW_H
