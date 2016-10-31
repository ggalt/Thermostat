#ifndef THEROMSTATOBJ_H
#define THEROMSTATOBJ_H

#include <QObject>
#include <QList>
#include <QQmlContext>


#include "thermostatevent.h"

class theromStatObj : public QObject
{
    Q_OBJECT
public:
    explicit theromStatObj(QObject *parent = 0);

    void Init(QQmlContext *q, QObject *rootObject);

signals:

public slots:
    void CreateNewThermoEvent(void);
    void AddNewThermoEvent(void);

private:
    QQmlContext *myRootContext;

    QList<thermostatEvent> m_thermoEventList;

};

#endif // THEROMSTATOBJ_H
