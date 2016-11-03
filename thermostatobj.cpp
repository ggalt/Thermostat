#include <QQuickView>
#include <QUrl>
#include <QLatin1String>
#include <QDebug>
#include <QObject>
#include <QString>

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
    setSource((QUrl(QLatin1String("qrc:/main.qml"))));
    show();
}


void thermoStatObj::CreateNewThermoEvent(void)
{
    qDebug() << "Success!!";
    QQuickView *view = new QQuickView;
    view->setSource(QUrl(QLatin1String("qrc:/ThermostatEventPage.qml")));
    view->show();
}

void thermoStatObj::AddNewThermoEvent(void)
{

}
