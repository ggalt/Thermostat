#ifndef THERMOEVENTLISTMODEL_H
#define THERMOEVENTLISTMODEL_H

#include <QObject>
#include <QtCore>
#include <QAbstractListModel>
#include <QModelIndex>
#include <QModelIndexList>
#include <QVariant>
#include <QList>

#include "thermostatevent.h"

class thermoEventListModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit thermoEventListModel(QObject *parent=0);
    ~thermoEventListModel();

public:
    virtual int rowCount(const QModelIndex &parent) const;
    virtual QVariant data(const QModelIndex &index, int role) const;

    int addEvent(thermostatEvent *event);

private:
    QList<thermostatEvent*> m_data;
};

#endif // THERMOEVENTLISTMODEL_H
