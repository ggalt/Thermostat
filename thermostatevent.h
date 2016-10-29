#ifndef THERMOSTATEVENT_H
#define THERMOSTATEVENT_H

#include <QObject>
#include <QDataStream>
#include <QTime>

class thermostatEvent : public QObject
{
    Q_OBJECT
    Q_PROPERTY(CoolingState coolingState READ coolingState WRITE setCoolingState NOTIFY coolingStateChanged)
    Q_PROPERTY(FanState fanState READ fanState WRITE setFanState NOTIFY fanStateChanged)
    Q_PROPERTY(SwitchState switchState READ switchState WRITE setSwitchState NOTIFY switchStateChanged)
    Q_PROPERTY(int targetTemp READ targetTemp WRITE setTargetTemp NOTIFY targetTempChanged)
    Q_PROPERTY(DayOfTheWeek dayOfTheWeek READ dayOfTheWeek WRITE setDayOfTheWeek NOTIFY dayOfTheWeekChanged)
    Q_PROPERTY(QTime startTime READ startTime WRITE setStartTime NOTIFY startTimeChanged)


public:
    explicit thermostatEvent(QObject *parent = 0);


    /// property declarations
public:
    enum CoolingState { Heat, Cool, Auto };
    enum FanState { FanOn, FanOff, FanAuto };
    enum SwitchState { SwitchOn, SwitchOff };
    enum DayOfTheWeek { Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday };
    Q_ENUM(CoolingState)
    Q_ENUM(FanState)
    Q_ENUM(SwitchState)
    Q_ENUM(DayOfTheWeek)

    CoolingState coolingState(void) {return m_coolingState; }
    FanState fanState(void) { return m_fanState; }
    SwitchState switchState(void) { return m_switchState; }
    int targetTemp(void) { return m_targetTemp; }
    DayOfTheWeek dayOfTheWeek(void) { return m_DOW; }
    QTime startTime(void) {return m_startTime; }

    void setCoolingState(CoolingState c) { m_coolingState = c; }
    void setFanState(FanState f) { m_fanState = f; }
    void setSwitchState(SwitchState s) { m_switchState = s; }
    void setTargetTemp(int t) {m_targetTemp = t; }
    void setDayOfTheWeek(DayOfTheWeek d) { m_DOW = d; }
    void setStartTime(QTime t) { m_startTime = t; }

signals:
    void coolingStateChanged();
    void fanStateChanged();
    void switchStateChanged();
    void targetTempChanged();
    void dayOfTheWeekChanged();
    void startTimeChanged();

public slots:

private:
    CoolingState m_coolingState;
    FanState m_fanState;
    SwitchState m_switchState;
    int m_targetTemp;
    DayOfTheWeek m_DOW;
    QTime m_startTime;
};

QDataStream &operator<<(QDataStream &ds, const thermostatEvent &obj);
QDataStream &operator>>(QDataStream &ds, thermostatEvent &obj) ;

#endif // THERMOSTATEVENT_H
