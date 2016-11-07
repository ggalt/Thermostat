#include "thermoeventwindow.h"
#include <QQmlEngine>
#include <QQmlContext>
#include <QQuickItem>
#include <QDebug>
#include <QObject>
#include <QQmlProperty>
#include <QString>

thermoEventWindow::thermoEventWindow(QWindow *parent) : QQuickView(parent)
{
    setObjectName("thermoEventWindow");
    qDebug() << "start of thermoeventwindow";
}

thermoEventWindow::~thermoEventWindow()
{
    close();
}

void thermoEventWindow::Init( void )
{
    theEvent = new thermostatEvent(this);

    engine()->rootContext()->setContextProperty("thermostatEvent", theEvent);

    setSource(QUrl(QLatin1String("qrc:/qml/ThermostatEventPage.qml")));
    QQuickItem *item = this->rootObject();
    QObject::connect(item, SIGNAL(accepted()),
                     this, SLOT(acceptResult()));
    QObject::connect(item, SIGNAL(cancelled()),
                     this, SLOT(cancelResult()));

    this->show();
}


void thermoEventWindow::acceptResult(void)
{
//    property alias dayOfWeek: tmblDayOfWeek.dayResult
//    property alias hour: tmblHour.hourResult
//    property alias minute: tmblMinute.minuteResult
//    property alias targetTemp: sliderTemp.value
//    property int fanState
//    property int heatState

//    qDebug() << "Attempt to read property" << QQmlProperty::read(this->rootObject(),"dayOfWeek").toString();

    int fanState = QQmlProperty::read(rootObject(),"fanState").toInt();
    int heatState = QQmlProperty::read(rootObject(), "heatState").toInt();
    QString dayOfWeek = QQmlProperty::read(rootObject(), "dayOfWeek").toString();
    QString hour = QQmlProperty::read(rootObject(), "hour").toString();
    QString minutes = QQmlProperty::read(rootObject(), "minute").toString();
    QString targetTemp = QQmlProperty::read(rootObject(), "targetTemp").toString();

    /// FAN
    if(fanState==1) // fan is set to "ON"
        theEvent->setFanState(thermostatEvent::FanOn);
    else            // fans is set o "AUTO"
        theEvent->setFanState(thermostatEvent::FanAuto);

    /// AC / HEAT
    if(heatState==1)    // AC is ON
        theEvent->setCoolingState(thermostatEvent::Cool);
    else                // HEAT is ON
        theEvent->setCoolingState(thermostatEvent::Heat);

    // DAY OF WEEK
    if( dayOfWeek == "SUN" ) {
            theEvent->setDayOfTheWeek(thermostatEvent::Sunday);
        }
    else if( dayOfWeek == "MON" ) {
            theEvent->setDayOfTheWeek(thermostatEvent::Monday);
        }
    else if( dayOfWeek == "TUE" ) {
            theEvent->setDayOfTheWeek(thermostatEvent::Tuesday);
        }
    else if( dayOfWeek == "WED" ) {
        theEvent->setDayOfTheWeek(thermostatEvent::Wednesday);
    }
    else if( dayOfWeek == "THU" ) {
            theEvent->setDayOfTheWeek(thermostatEvent::Thursday);
    }
    else if( dayOfWeek == "FRI" ) {
            theEvent->setDayOfTheWeek(thermostatEvent::Friday);
    }
    else {  //( dayOfWeek == "SAT" )
            theEvent->setDayOfTheWeek(thermostatEvent::Saturday);
        }

    QTime t;

    int hh = hour.left(2).toInt();
    if(hour.contains("PM"))
        hh += 12;
    int mm = minutes.toInt();

    t.setHMS(hh,mm,0,0);

    theEvent->setStartTime(t);
    theEvent->setTargetTemp(targetTemp.toInt());

    qDebug() << "Complete Event -- Start Time:" << theEvent->startTime() << "Day of Week" <<
                theEvent->dayOfTheWeek() << "Target temp:" << theEvent->targetTemp() <<
                "Fan State:" << theEvent->fanState() << "Heat State:" << theEvent->coolingState();

    emit addEvent(theEvent);
    this->deleteLater();
}

void thermoEventWindow:: cancelResult(void)
{
    this->deleteLater();
}
