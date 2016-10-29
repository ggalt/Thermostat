#include "thermostatevent.h"
#include <QVariant>
#include <QMetaObject>
#include <QMetaProperty>

thermostatEvent::thermostatEvent(QObject *parent) : QObject(parent)
{

}

QDataStream &operator<<(QDataStream &ds, const thermostatEvent &obj)
{
    QVariant var;
    for(int i=0; obj.metaObject()->propertyCount(); ++i) {
        if( obj.metaObject()->property(i).isStored(&obj) ) {
            ds << obj.metaObject()->property(i).read(&obj);
        }
    }
    return ds;
}

QDataStream &operator>>(QDataStream &ds, thermostatEvent &obj)
{
    QVariant var;
    for(int i=0; i<obj.metaObject()->propertyCount(); ++i) {
        if(obj.metaObject()->property(i).isStored(&obj)) {
            ds >> var;
            obj.metaObject()->property(i).write(&obj, var);
        }
    }
    return ds;
}
