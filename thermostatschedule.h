#ifndef THERMOSTATSCHEDULE_H
#define THERMOSTATSCHEDULE_H

#include <QObject>

class thermoStatSchedule : public QObject
{
    Q_OBJECT
public:
    explicit thermoStatSchedule(QObject *parent = 0);

signals:

public slots:
};

#endif // THERMOSTATSCHEDULE_H