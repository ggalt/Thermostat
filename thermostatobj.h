#ifndef THEROMSTATOBJ_H
#define THEROMSTATOBJ_H

#include <QQuickView>
#include <QList>
#include <QQmlContext>


#include "thermoeventwindow.h"
#include "thermostatevent.h"

class thermoStatObj : public QQuickView
{
    Q_OBJECT
public:
    explicit thermoStatObj(QWindow *parent = 0);
    ~thermoStatObj(void);

    void Init(void);

signals:

public slots:
    Q_INVOKABLE void createNewThermoEvent(void);
    Q_INVOKABLE void addNewThermoEvent(void);

private:
    QQmlContext *myRootContext;

    thermoEventWindow *thermoEvent;
    QList<thermostatEvent> m_thermoEventList;

};

#endif // THEROMSTATOBJ_H