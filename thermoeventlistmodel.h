#ifndef THERMOEVENTLISTMODEL_H
#define THERMOEVENTLISTMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include <QModelIndex>
#include <QModelIndexList>
#include <QVariant>
#include <QList>

#include "thermostatevent.h"

class thermoEventListModel : public QAbstractListModel
{
    Q_OBJECT
//    Q_PROPERTY(CoolingState coolingState READ coolingState WRITE setCoolingState NOTIFY coolingStateChanged)
//    Q_PROPERTY(FanState fanState READ fanState WRITE setFanState NOTIFY fanStateChanged)
//    Q_PROPERTY(SwitchState switchState READ switchState WRITE setSwitchState NOTIFY switchStateChanged)
//    Q_PROPERTY(int targetTemp READ targetTemp WRITE setTargetTemp NOTIFY targetTempChanged)
//    Q_PROPERTY(DayOfTheWeek dayOfTheWeek READ dayOfTheWeek WRITE setDayOfTheWeek NOTIFY dayOfTheWeekChanged)
//    Q_PROPERTY(QTime startTime READ startTime WRITE setStartTime NOTIFY startTimeChanged)

public:
    explicit thermoEventListModel(QObject *parent=0);
    ~thermoEventListModel();

public:
    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;
//    virtual QHash<int, QByteArray> thermoEventListModel::roleNames() const;
    int addEvent(thermostatEvent *event);

public:
    enum Roles {WordRole = Qt::UserRole, CountRole};

//    CoolingState coolingState(void) {return m_coolingState; }
//    FanState fanState(void) { return m_fanState; }
//    SwitchState switchState(void) { return m_switchState; }
//    int targetTemp(void) { return m_targetTemp; }
//    DayOfTheWeek dayOfTheWeek(void) { return m_DOW; }
//    QTime startTime(void) {return m_startTime; }

//    Q_INVOKABLE void setCoolingState(CoolingState c) { m_coolingState = c; }
//    Q_INVOKABLE void setFanState(FanState f) { m_fanState = f; }
//    Q_INVOKABLE void setSwitchState(SwitchState s) { m_switchState = s; }
//    Q_INVOKABLE void setTargetTemp(int t) {m_targetTemp = t; }
//    Q_INVOKABLE void setDayOfTheWeek(DayOfTheWeek d) { m_DOW = d; }
//    Q_INVOKABLE void setStartTime(QTime t) { m_startTime = t; }

signals:
//    void coolingStateChanged();
//    void fanStateChanged();
//    void switchStateChanged();
//    void targetTempChanged();
//    void dayOfTheWeekChanged();
//    void startTimeChanged();



private:
    QList<thermostatEvent*> m_data;

//    CoolingState m_coolingState;
//    FanState m_fanState;
//    SwitchState m_switchState;
//    int m_targetTemp;
//    DayOfTheWeek m_DOW;
//    QTime m_startTime;
};

#endif // THERMOEVENTLISTMODEL_H
