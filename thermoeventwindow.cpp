#include "thermoeventwindow.h"
#include <QQmlEngine>
#include <QQmlContext>
#include <QDebug>
#include <QObject>

thermoEventWindow::thermoEventWindow(QWindow *parent) : QQuickView(parent)
{
    setObjectName("thermoEventWindow");
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
    QObject *item = (QObject*)rootObject();
    QObject::connect(item, SIGNAL(accepted()),
                     this, SLOT(acceptResult()));
    QObject::connect(item, SIGNAL(cancelled()),
                     this, SLOT(cancelResult()));
    show();
}


void thermoEventWindow::acceptResult(void)
{
    qDebug() << theEvent->coolingState();
    qDebug() << theEvent->dayOfTheWeek();
    this->deleteLater();
}

void thermoEventWindow:: cancelResult(void)
{
    this->deleteLater();
}
