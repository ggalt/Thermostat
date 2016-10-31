#include <QQuickView>
#include <QUrl>
#include <QLatin1String>
#include <QDebug>
#include <QObject>
#include <QString>

#include "theromstatobj.h"

theromStatObj::theromStatObj(QObject *parent) : QObject(parent)
{

}

void theromStatObj::Init(QQmlContext *q, QObject *rootObject)
{
    myRootContext = q;
    QObject::connect(rootObject, SIGNAL(addThermoEventSignal()),
                     this, SLOT(CreateNewThermoEvent()));
}


void theromStatObj::CreateNewThermoEvent(void)
{
    qDebug() << "Success!!";
    QQuickView *view = new QQuickView;
    view->setSource(QUrl(QLatin1String("qrc:/ThermostatEventPage.qml")));
    view->show();
}

void theromStatObj::AddNewThermoEvent(void)
{

}
