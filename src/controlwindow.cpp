#include "controlwindow.h"

#include "simulationserver.h"

#include <QtCore/QCoreApplication>
#include <QtCore/QSignalBlocker>
#include <QtCore/QVariant>
#include <QtCore/QLocale>
#include <QtCore/QVector>
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

#include <algorithm>
#include <utility>

QT_BEGIN_NAMESPACE

namespace {
enum ColumnIndex {
    TagColumn = 0,
    TypeColumn = 1,
    MinColumn = 2,
    MaxColumn = 3,
    PeriodColumn = 4,
    CurrentValueColumn = 5,
    ResetColumn = 6
};

constexpr int kValueDecimals = 3;
constexpr int kValueRefreshIntervalMs = 250;

// Сервер живёт в отдельном потоке, поэтому его слоты нельзя дёргать напрямую:
// они трогают open62541 и таймеры, привязанные к тому потоку.
template <typename Func>
void postToServer(DataSimulationServer *server, Func &&fn)
{
    QMetaObject::invokeMethod(server, std::forward<Func>(fn), Qt::QueuedConnection);
}

// Блокирующий вариант — там, где сразу после вызова нужно прочитать результат.
template <typename Func>
void callOnServer(DataSimulationServer *server, Func &&fn)
{
    QMetaObject::invokeMethod(server, std::forward<Func>(fn), Qt::BlockingQueuedConnection);
}

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
    resize(1180, 560);
    setMinimumWidth(1080);

    auto *layout = new QVBoxLayout(this);
    auto *statusLayout = new QHBoxLayout();
    auto *statusCaption = new QLabel(tr("Статус:"), this);
    m_statusLabel = new QLabel(this);
    statusLayout->addWidget(statusCaption);
    statusLayout->addWidget(m_statusLabel);
    statusLayout->addStretch();
    layout->addLayout(statusLayout);

    m_table = new QTableWidget(this);
    m_table->setColumnCount(7);
    m_table->setHorizontalHeaderLabels({tr("Тег"), tr("Тип симуляции"), tr("Минимум"), tr("Максимум"),
                                        tr("Период, сек/значение"), tr("Текущее значение"), tr("Сброс")});
    m_table->horizontalHeader()->setStretchLastSection(true);
    m_table->horizontalHeader()->setSectionResizeMode(TagColumn, QHeaderView::ResizeToContents);
    m_table->horizontalHeader()->setSectionResizeMode(MinColumn, QHeaderView::ResizeToContents);
    m_table->horizontalHeader()->setSectionResizeMode(MaxColumn, QHeaderView::ResizeToContents);
    m_table->horizontalHeader()->setSectionResizeMode(PeriodColumn, QHeaderView::ResizeToContents);
    // Не ResizeToContents: колонка меняется постоянно, а этот режим пересчитывал
    // бы ширину по всем строкам на каждое обновление значения.
    m_table->horizontalHeader()->setSectionResizeMode(CurrentValueColumn, QHeaderView::Interactive);
    m_table->horizontalHeader()->setSectionResizeMode(ResetColumn, QHeaderView::ResizeToContents);
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
    m_valueRefreshTimer.stop();
    if (m_server) {
        auto *server = m_server;
        callOnServer(server, [server]() { server->shutdown(); });
    }
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
                    auto *server = m_server;
                    if (currentType == DataSimulationServer::SimulationType::Sine)
                        postToServer(server, [server, row, value]() { server->setSineMinimum(row, value); });
                    else if (currentType == DataSimulationServer::SimulationType::Peaks)
                        postToServer(server, [server, row, value]() { server->setPeakMinimum(row, value); });
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
                    auto *server = m_server;
                    if (currentType == DataSimulationServer::SimulationType::Sine)
                        postToServer(server, [server, row, value]() { server->setSineMaximum(row, value); });
                    else if (currentType == DataSimulationServer::SimulationType::Peaks)
                        postToServer(server, [server, row, value]() { server->setPeakMaximum(row, value); });
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
                    auto *server = m_server;
                    if (currentType == DataSimulationServer::SimulationType::Manual) {
                        postToServer(server, [server, row, value]() { server->setManualValue(row, value); });
                    } else if (currentType == DataSimulationServer::SimulationType::Sine) {
                        postToServer(server, [server, row, value]() { server->setSinePeriod(row, value); });
                    } else if (currentType == DataSimulationServer::SimulationType::Peaks) {
                        postToServer(server, [server, row, value]() { server->setPeakPeriod(row, value); });
                    }
                });

        m_table->setCellWidget(row, PeriodColumn, periodSpinBox);

        auto *currentValueItem =
                new QTableWidgetItem(QLocale().toString(m_server->currentValue(row), 'f', kValueDecimals));
        currentValueItem->setTextAlignment(Qt::AlignRight | Qt::AlignVCenter);
        m_table->setItem(row, CurrentValueColumn, currentValueItem);

        auto *resetWidget = new QWidget(m_table);
        auto *resetLayout = new QHBoxLayout(resetWidget);
        resetLayout->setContentsMargins(0, 0, 0, 0);
        auto *resetValueButton = new QPushButton(tr("Мин"), resetWidget);
        resetValueButton->setToolTip(tr("Сбросить текущее значение к минимуму"));
        auto *resetPeriodButton = new QPushButton(tr("Период"), resetWidget);
        resetPeriodButton->setToolTip(tr("Сбросить период к значению по умолчанию"));
        resetLayout->addWidget(resetValueButton);
        resetLayout->addWidget(resetPeriodButton);
        m_table->setCellWidget(row, ResetColumn, resetWidget);

        connect(resetValueButton, &QPushButton::clicked, this, [this, row]() {
            if (m_server) {
                auto *server = m_server;
                callOnServer(server, [server, row]() { server->resetValueToMinimum(row); });
            }
            updateValueEditor(row);
            refreshCurrentValues();
        });
        connect(resetPeriodButton, &QPushButton::clicked, this, [this, row]() {
            if (m_server) {
                auto *server = m_server;
                callOnServer(server, [server, row]() { server->resetPeriod(row); });
            }
            updateValueEditor(row);
        });

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
    // Останавливает сервер closeEvent(), close() его и вызывает.
    connect(m_closeButton, &QPushButton::clicked, this, [this]() {
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
    // valueChanged() приходит до тысячи раз в секунду. Через границу потоков это
    // столько же событий в очереди GUI, поэтому таблицу обновляем опросом снимка.
    m_valueRefreshTimer.setInterval(kValueRefreshIntervalMs);
    m_valueRefreshTimer.setSingleShot(false);
    connect(&m_valueRefreshTimer, &QTimer::timeout, this, &ControlWindow::refreshCurrentValues);
    m_valueRefreshTimer.start();
}

void ControlWindow::refreshCurrentValues()
{
    if (!m_server || !m_table)
        return;

    const QVector<double> values = m_server->currentValues();
    const int rows = std::min(int(values.size()), m_table->rowCount());
    const QLocale locale;

    for (int row = 0; row < rows; ++row) {
        auto *item = m_table->item(row, CurrentValueColumn);
        if (!item)
            continue;

        const QString text = locale.toString(values.at(row), 'f', kValueDecimals);
        if (item->text() != text)
            item->setText(text);
    }
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
    auto *server = m_server;
    callOnServer(server, [server, row, type]() { server->setSimulationType(row, type); });
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
