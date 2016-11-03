#ifndef THERMOEVENTWINDOW_H
#define THERMOEVENTWINDOW_H

#include <QObject>
#include <QQuickView>

class thermoEventWindow : public QQuickView
{
    Q_OBJECT
public:
    explicit thermoEventWindow(QWindow *parent = 0);
};

#endif // THERMOEVENTWINDOW_H
