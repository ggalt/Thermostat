#ifndef THERMOEVENTLISTMODEL_H
#define THERMOEVENTLISTMODEL_H

#include <QObject>
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
//    virtual QHash<int, QByteArray> thermoEventListModel::roleNames() const;
    int addEvent(thermostatEvent *event);

public:
    enum Roles {WordRole = Qt::UserRole, CountRole};



private:
    QList<thermostatEvent*> m_data;
};

#endif // THERMOEVENTLISTMODEL_H
