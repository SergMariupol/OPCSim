#include "controlwindow.h"

#include "simulationserver.h"

#include <QtCore/QCoreApplication>
#include <QtCore/QSignalBlocker>
#include <QtCore/QVariant>
#include <QtGui/QCloseEvent>
#include <QtWidgets/QAbstractItemView>
#include <QtWidgets/QComboBox>
#include <QtWidgets/QDoubleSpinBox>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QTableWidget>
#include <QtWidgets/QTableWidgetItem>
#include <QtWidgets/QVBoxLayout>

QT_BEGIN_NAMESPACE

namespace {
enum ColumnIndex {
    TagColumn = 0,
    TypeColumn = 1,
    MinColumn = 2,
    MaxColumn = 3,
    PeriodColumn = 4
};

QString simulationTypeToString(DataSimulationServer::SimulationType type)
{
    switch (type) {
    case DataSimulationServer::SimulationType::Sine:
        return QObject::tr("Синусоида");
    case DataSimulationServer::SimulationType::Peaks:
        return QObject::tr("Пики");
    case DataSimulationServer::SimulationType::Manual:
        return QObject::tr("Вручную");
    }
    return QObject::tr("Неизвестно");
}
}

ControlWindow::ControlWindow(DataSimulationServer *server, QWidget *parent)
    : QWidget(parent)
    , m_server(server)
{
    setWindowTitle(tr("Управление симуляцией OPC"));
    resize(640, 480);

    auto *layout = new QVBoxLayout(this);
    auto *statusLayout = new QHBoxLayout();
    auto *statusCaption = new QLabel(tr("Статус:"), this);
    m_statusLabel = new QLabel(this);
    statusLayout->addWidget(statusCaption);
    statusLayout->addWidget(m_statusLabel);
    statusLayout->addStretch();
    layout->addLayout(statusLayout);

    m_table = new QTableWidget(this);
    m_table->setColumnCount(5);
    m_table->setHorizontalHeaderLabels(
            {tr("Тег"), tr("Тип симуляции"), tr("Минимум"), tr("Максимум"), tr("Период/значение")});
    m_table->horizontalHeader()->setStretchLastSection(true);
    m_table->horizontalHeader()->setSectionResizeMode(TagColumn, QHeaderView::ResizeToContents);
    m_table->horizontalHeader()->setSectionResizeMode(MinColumn, QHeaderView::ResizeToContents);
    m_table->horizontalHeader()->setSectionResizeMode(MaxColumn, QHeaderView::ResizeToContents);
    m_table->horizontalHeader()->setSectionResizeMode(PeriodColumn, QHeaderView::ResizeToContents);
    m_table->verticalHeader()->setVisible(false);
    m_table->setEditTriggers(QAbstractItemView::NoEditTriggers);
    m_table->setSelectionMode(QAbstractItemView::NoSelection);

    layout->addWidget(m_table);

    auto *buttonLayout = new QHBoxLayout();
    m_startButton = new QPushButton(tr("Запустить"), this);
    m_stopButton = new QPushButton(tr("Остановить"), this);
    m_closeButton = new QPushButton(tr("Закрыть симуляцию"), this);

    buttonLayout->addStretch();
    buttonLayout->addWidget(m_startButton);
    buttonLayout->addWidget(m_stopButton);
    buttonLayout->addWidget(m_closeButton);

    layout->addLayout(buttonLayout);

    populateTable();
    setupConnections();

    updateStatusIndicator(m_server && m_server->isRunning() ? ServerState::Running : ServerState::Stopped);
}

void ControlWindow::closeEvent(QCloseEvent *event)
{
    if (m_server)
        m_server->shutdown();
    QWidget::closeEvent(event);
    QCoreApplication::quit();
}

void ControlWindow::populateTable()
{
    if (!m_server)
        return;

    m_table->setRowCount(m_server->valueCount());

    for (int row = 0; row < m_server->valueCount(); ++row) {
        auto *item = new QTableWidgetItem(m_server->displayName(row));
        m_table->setItem(row, TagColumn, item);

        auto *combo = new QComboBox(m_table);
        combo->addItem(simulationTypeToString(DataSimulationServer::SimulationType::Sine),
                       QVariant::fromValue(int(DataSimulationServer::SimulationType::Sine)));
        combo->addItem(simulationTypeToString(DataSimulationServer::SimulationType::Peaks),
                       QVariant::fromValue(int(DataSimulationServer::SimulationType::Peaks)));
        combo->addItem(simulationTypeToString(DataSimulationServer::SimulationType::Manual),
                       QVariant::fromValue(int(DataSimulationServer::SimulationType::Manual)));

        const auto currentType = m_server->simulationType(row);
        const int currentIndex = combo->findData(int(currentType));
        combo->setCurrentIndex(currentIndex >= 0 ? currentIndex : 0);

        connect(combo, &QComboBox::currentIndexChanged, this, [this, row](int index) {
            handleTypeChange(row, index);
        });

        m_table->setCellWidget(row, TypeColumn, combo);

        auto *minSpinBox = new QDoubleSpinBox(m_table);
        minSpinBox->setDecimals(6);
        minSpinBox->setRange(-1000000.0, 1000000.0);

        connect(minSpinBox, qOverload<double>(&QDoubleSpinBox::valueChanged), this,
                [this, row](double value) {
                    auto *combo = qobject_cast<QComboBox *>(m_table->cellWidget(row, TypeColumn));
                    if (!combo || !m_server)
                        return;
                    const auto currentType =
                            static_cast<DataSimulationServer::SimulationType>(combo->currentData().toInt());
                    if (currentType == DataSimulationServer::SimulationType::Sine)
                        m_server->setSineMinimum(row, value);
                    else if (currentType == DataSimulationServer::SimulationType::Peaks)
                        m_server->setPeakMinimum(row, value);
                });

        m_table->setCellWidget(row, MinColumn, minSpinBox);

        auto *maxSpinBox = new QDoubleSpinBox(m_table);
        maxSpinBox->setDecimals(6);
        maxSpinBox->setRange(-1000000.0, 1000000.0);

        connect(maxSpinBox, qOverload<double>(&QDoubleSpinBox::valueChanged), this,
                [this, row](double value) {
                    auto *combo = qobject_cast<QComboBox *>(m_table->cellWidget(row, TypeColumn));
                    if (!combo || !m_server)
                        return;
                    const auto currentType =
                            static_cast<DataSimulationServer::SimulationType>(combo->currentData().toInt());
                    if (currentType == DataSimulationServer::SimulationType::Sine)
                        m_server->setSineMaximum(row, value);
                    else if (currentType == DataSimulationServer::SimulationType::Peaks)
                        m_server->setPeakMaximum(row, value);
                });

        m_table->setCellWidget(row, MaxColumn, maxSpinBox);

        auto *periodSpinBox = new QDoubleSpinBox(m_table);
        periodSpinBox->setDecimals(6);
        periodSpinBox->setRange(1.0, 1000000.0);

        connect(periodSpinBox, qOverload<double>(&QDoubleSpinBox::valueChanged), this,
                [this, row](double value) {
                    auto *combo = qobject_cast<QComboBox *>(m_table->cellWidget(row, TypeColumn));
                    if (!combo || !m_server)
                        return;
                    const auto currentType =
                            static_cast<DataSimulationServer::SimulationType>(combo->currentData().toInt());
                    if (currentType == DataSimulationServer::SimulationType::Manual) {
                        m_server->setManualValue(row, value);
                    } else if (currentType == DataSimulationServer::SimulationType::Sine) {
                        m_server->setSinePeriod(row, value);
                    } else if (currentType == DataSimulationServer::SimulationType::Peaks) {
                        m_server->setPeakPeriod(row, value);
                    }
                });

        m_table->setCellWidget(row, PeriodColumn, periodSpinBox);
        updateValueEditor(row);
    }

    m_table->resizeColumnsToContents();
}

void ControlWindow::setupConnections()
{
    if (!m_server)
        return;

    connect(m_startButton, &QPushButton::clicked, m_server, &DataSimulationServer::launch);
    connect(m_stopButton, &QPushButton::clicked, m_server, &DataSimulationServer::shutdown);
    connect(m_closeButton, &QPushButton::clicked, this, [this]() {
        if (m_server)
            m_server->shutdown();
        close();
    });

    connect(m_server, &DataSimulationServer::runningChanged, this, [this](bool running) {
        updateStatusIndicator(running ? ServerState::Running : ServerState::Stopped);
    });
    connect(m_server, &DataSimulationServer::errorOccurred, this, [this](const QString &message) {
        if (message.isEmpty()) {
            updateStatusIndicator(m_server && m_server->isRunning() ? ServerState::Running : ServerState::Stopped);
        } else {
            updateStatusIndicator(ServerState::Error, message);
        }
    });
}

void ControlWindow::handleTypeChange(int row, int comboIndex)
{
    if (!m_server)
        return;

    auto *combo = qobject_cast<QComboBox *>(m_table->cellWidget(row, TypeColumn));
    if (!combo)
        return;

    const QVariant data = combo->itemData(comboIndex);
    if (!data.isValid())
        return;

    const auto type = static_cast<DataSimulationServer::SimulationType>(data.toInt());
    m_server->setSimulationType(row, type);
    updateValueEditor(row);
}

void ControlWindow::updateValueEditor(int row)
{
    auto *combo = qobject_cast<QComboBox *>(m_table->cellWidget(row, TypeColumn));
    auto *minSpinBox = qobject_cast<QDoubleSpinBox *>(m_table->cellWidget(row, MinColumn));
    auto *maxSpinBox = qobject_cast<QDoubleSpinBox *>(m_table->cellWidget(row, MaxColumn));
    auto *periodSpinBox = qobject_cast<QDoubleSpinBox *>(m_table->cellWidget(row, PeriodColumn));
    if (!combo || !minSpinBox || !maxSpinBox || !periodSpinBox)
        return;

    const auto type = static_cast<DataSimulationServer::SimulationType>(combo->currentData().toInt());
    const bool isManual = type == DataSimulationServer::SimulationType::Manual;

    minSpinBox->setEnabled(!isManual);
    maxSpinBox->setEnabled(!isManual);

    QSignalBlocker minBlocker(minSpinBox);
    QSignalBlocker maxBlocker(maxSpinBox);
    QSignalBlocker periodBlocker(periodSpinBox);

    if (isManual) {
        periodSpinBox->setRange(-1000000.0, 1000000.0);
        periodSpinBox->setValue(m_server ? m_server->currentValue(row) : periodSpinBox->value());
    } else {
        periodSpinBox->setRange(1.0, 1000000.0);
        if (type == DataSimulationServer::SimulationType::Sine) {
            minSpinBox->setValue(m_server ? m_server->sineMinimum(row) : minSpinBox->value());
            maxSpinBox->setValue(m_server ? m_server->sineMaximum(row) : maxSpinBox->value());
            periodSpinBox->setValue(m_server ? m_server->sinePeriod(row) : periodSpinBox->value());
        } else if (type == DataSimulationServer::SimulationType::Peaks) {
            minSpinBox->setValue(m_server ? m_server->peakMinimum(row) : minSpinBox->value());
            maxSpinBox->setValue(m_server ? m_server->peakMaximum(row) : maxSpinBox->value());
            periodSpinBox->setValue(m_server ? m_server->peakPeriod(row) : periodSpinBox->value());
        }
    }
}

void ControlWindow::updateStatusIndicator(ControlWindow::ServerState state, const QString &message)
{
    if (!m_statusLabel)
        return;

    QString text;
    QString color;
    QString toolTip;

    switch (state) {
    case ServerState::Running:
        text = tr("Работает");
        color = QStringLiteral("#2e7d32");
        break;
    case ServerState::Stopped:
        text = tr("Остановлен");
        color = QStringLiteral("#616161");
        break;
    case ServerState::Error:
        text = message.isEmpty() ? tr("Ошибка") : tr("Ошибка: %1").arg(message);
        color = QStringLiteral("#c62828");
        toolTip = message;
        break;
    }

    m_statusLabel->setText(text);
    m_statusLabel->setToolTip(toolTip);
    const QString style = QStringLiteral("QLabel { font-weight: bold; color: %1; }");
    m_statusLabel->setStyleSheet(style.arg(color));
}

QT_END_NAMESPACE
