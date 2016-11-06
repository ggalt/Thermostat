#ifndef THERMOEVENTWINDOW_H
#define THERMOEVENTWINDOW_H

#include <QObject>
#include <QQuickView>

#include "thermostatevent.h"

class thermoEventWindow : public QQuickView
{
    Q_OBJECT
public:
    explicit thermoEventWindow(QWindow *parent = 0);
    ~thermoEventWindow();

    void Init(void);

public slots:
    void acceptResult(void);
    void cancelResult(void);

private:
    thermostatEvent *theEvent;

};

#endif // THERMOEVENTWINDOW_H
