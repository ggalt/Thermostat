#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QList>
#include <QObject>
#include <QDebug>
#include "thermostatobj.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

//    QQmlApplicationEngine engine;
//    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    thermoStatObj *thermo = new thermoStatObj();
    thermo->Init();
    int retVal = app.exec();
    return retVal;

    //    QList<QObject*> rootList = engine.rootObjects();
//    qDebug() << rootList.at(0)->children().count();
//    for(int i = 0; i < rootList.at(0)->children().count(); i++)
//        qDebug() << rootList.at(0)->children().at(i)->objectName();

//    thermo->Init(engine.rootContext(), engine.rootObjects().first());

//    return app.exec();
}
