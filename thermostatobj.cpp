#include <QQuickView>
#include <QUrl>
#include <QLatin1String>
#include <QDebug>
#include <QObject>
#include <QString>
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
    m_thermoEventList.append(e);
    qDebug() << "Event List" << m_thermoEventList.at(m_thermoEventList.count()-1)->dayOfTheWeek();
}
