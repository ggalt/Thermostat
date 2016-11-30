QT += qml quick

CONFIG += c++11

SOURCES += main.cpp \
    thermostatobj.cpp \
    thermostatevent.cpp \
    thermoeventwindow.cpp \
    thermoeventlistmodel.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = qml/..

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    thermostatobj.h \
    thermostatevent.h \
    thermoeventwindow.h \
    thermoeventlistmodel.h
OTHER_FILES += \
    qml/main.qml\
    qml/Page1.qml\
    qml/Page2.qml\
    qml/ThermostatEventPage.qml\
    qml.qrc

DISTFILES += \
    qml/CheckableStateButton.qml \
    qml/thermoEventDelegate.qml
