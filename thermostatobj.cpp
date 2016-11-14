#include <QQuickView>
#include <QUrl>
#include <QLatin1String>
#include <QDebug>
#include <QObject>
#include <QString>
#include <QList>
#include <QListIterator>
#include <QQmlEngine>
#include <QQmlContext>
#include <QDebug>

#include "thermostatobj.h"

thermoStatObj::thermoStatObj(QWindow *parent) : QQuickView(parent)
{
    setObjectName("theromStatObj");
}

thermoStatObj::~thermoStatObj(void)
{
    close();
}

void thermoStatObj::Init(void)
{
    this->engine()->rootContext()->setContextProperty("thermoObj", this);
    setSource((QUrl(QLatin1String("qrc:/qml/main.qml"))));
//    setSource(QUrl(QLatin1String("qrc:/qml/ThermostatEventPage.qml")));
    show();
}


void thermoStatObj::createNewThermoEvent(void)
{
    qDebug() << "Success!!";

    thermoEvent = new thermoEventWindow(this);
    connect(thermoEvent,SIGNAL(addEvent(thermostatEvent *)),
            this,SLOT(addEvent(thermostatEvent *)));

    thermoEvent->Init();
}

void thermoStatObj::addNewThermoEvent(void)
{

}


void thermoStatObj::addEvent( thermostatEvent *e)
{
    thermostatEvent::DayOfTheWeek days[] {thermostatEvent::Monday,thermostatEvent::Tuesday,thermostatEvent::Wednesday,thermostatEvent::Thursday,thermostatEvent::Friday,thermostatEvent::Saturday,thermostatEvent::Sunday};
    qDebug() << "-------- day of week set to" << e->dayOfTheWeek();

    if(e->dayOfTheWeek()==thermostatEvent::WeekDays) {
        qDebug() << "Weekday event, copy for all weekdays";
        QList<thermostatEvent::DayOfTheWeek> weekDays;
        for(int c=0; c < 5; c++)
            weekDays.append(days[c]);
        QListIterator<thermostatEvent::DayOfTheWeek> i(weekDays);
        while (i.hasNext()) {
            thermostatEvent *temp = new thermostatEvent();
            temp->setDayOfTheWeek(i.next());
            temp->setStartTime(e->startTime());
            temp->setCoolingState(e->coolingState());
            temp->setFanState(e->fanState());
            temp->setSwitchState(e->switchState());
            temp->setTargetTemp(e->targetTemp());
            m_thermoEventList.append(temp);
            qDebug() << "Insert" << temp->dayOfTheWeek() << temp->startTime() << temp->targetTemp() << temp->coolingState();
        }
    } else if(e->dayOfTheWeek()==thermostatEvent::Weekend) {
        qDebug() << "Weekend event, copy for all weekend days";
        QList<thermostatEvent::DayOfTheWeek> weekendDays;
        weekendDays.append(days[5]);
        weekendDays.append(days[6]);
        QListIterator<thermostatEvent::DayOfTheWeek> i(weekendDays);
        while (i.hasNext()) {
            thermostatEvent *temp = new thermostatEvent();
            temp->setDayOfTheWeek(i.next());
            temp->setStartTime(e->startTime());
            temp->setCoolingState(e->coolingState());
            temp->setFanState(e->fanState());
            temp->setSwitchState(e->switchState());
            temp->setTargetTemp(e->targetTemp());
            m_thermoEventList.append(temp);
            qDebug() << "Insert" << temp->dayOfTheWeek() << temp->startTime() << temp->targetTemp() << temp->coolingState();
        }
    } else if(e->dayOfTheWeek()==thermostatEvent::AllWeek) {
        qDebug() << "All week event, copy for all days";
        QList<thermostatEvent::DayOfTheWeek> allDays;
        for(int c=0; c < 7; c++)
            allDays.append(days[c]);
        QListIterator<thermostatEvent::DayOfTheWeek> i(allDays);
        while (i.hasNext()) {
            thermostatEvent *temp = new thermostatEvent();
            temp->setDayOfTheWeek(i.next());
            temp->setStartTime(e->startTime());
            temp->setCoolingState(e->coolingState());
            temp->setFanState(e->fanState());
            temp->setSwitchState(e->switchState());
            temp->setTargetTemp(e->targetTemp());
            m_thermoEventList.append(temp);
            qDebug() << "Insert" << temp->dayOfTheWeek() << temp->startTime() << temp->targetTemp() << temp->coolingState();
        }
    } else {
        m_thermoEventList.append(e);
    }
    qDebug() << "Event List" << m_thermoEventList.at(m_thermoEventList.count()-1)->dayOfTheWeek();
}
