#ifndef THERMOEVENTWINDOW_H
#define THERMOEVENTWINDOW_H

#include <QObject>
#include <QQuickView>
#include <QQmlComponent>


#include "thermostatevent.h"

class thermoEventWindow : public QQuickView
{
    Q_OBJECT
public:
    explicit thermoEventWindow(QWindow *parent = 0);
    ~thermoEventWindow();

    void Init(void);

signals:
    void addEvent( thermostatEvent *e );

public slots:
    void acceptResult(void);
    void cancelResult(void);

private:
    thermostatEvent *theEvent;
    QQmlComponent *theComponent;

};

#endif // THERMOEVENTWINDOW_H
