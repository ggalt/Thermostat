#ifndef THEROMSTATOBJ_H
#define THEROMSTATOBJ_H

#include <QObject>

class theromStatObj : public QObject
{
    Q_OBJECT
public:
    explicit theromStatObj(QObject *parent = 0);

signals:

public slots:
};

#endif // THEROMSTATOBJ_H