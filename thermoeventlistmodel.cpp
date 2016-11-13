#include "thermoeventlistmodel.h"

thermoEventListModel::thermoEventListModel(QObject *parent)
    : QAbstractListModel(parent)
{

}

thermoEventListModel::~thermoEventListModel()
{

}


int thermoEventListModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_data.count();
}

QVariant thermoEventListModel::data(const QModelIndex &index, int role) const
{
    int row = index.row();

    if( row < 0 || row >= m_data.count() ) {    // make sure it's a sane request
        return QVariant();
    }

    QVariant retVal = QVariant::fromValue( m_data.value(row) );

    return retVal;
}

int thermoEventListModel::addEvent(thermostatEvent *event)
{
    m_data.append(event);
    return m_data.count();
}
