import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Rectangle {
    id: thermostatEventRec
    width: 320
    height: 240
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#ffffff"
        }

        GradientStop {
            position: 1
            color: "#00ff19"
        }
    }

    Tumbler {
        id: tmblrDayOfWeek
        width: 55
        height: 150
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
    }

    Tumbler {
        id: tmblrHour
        width: 55
        height: 150
        anchors.left: tmblrDayOfWeek.right
        anchors.leftMargin: 16
        anchors.top: parent.top
        anchors.topMargin: 0
    }

    Tumbler {
        id: tmblrMinute
        width: 55
        height: 150
        anchors.left: lblColon.right
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
    }

    Switch {
        id: swFan
        x: 197
        y: 8
        width: 115
        height: 40
        text: qsTr("Fan")
    }

    Switch {
        id: swHeating
        x: 197
        y: 54
        text: qsTr("Heat/AC")
    }

    Slider {
        id: sliderTemp
        x: 0
        y: 206
        width: 320
        height: 26
        value: 0.5

        onXChanged: {
            targetTemp.m_targetTemp = value
        }
    }

    Label {
        id: targetTemp
        property int m_targetTemp: 70
        x: 206
        y: 107
        width: 106
        height: 85
        text: m_targetTemp
        font.pointSize: 40
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Label {
        id: lblColon
        y: 68
        text: qsTr(":")
        anchors.verticalCenter: tmblrHour.verticalCenter
        anchors.left: tmblrHour.right
        anchors.leftMargin: 0
        font.pointSize: 20
    }

    Button {
        id: btnOK
        y: 156
        width: 60
        text: qsTr("Accept")
        anchors.left: parent.left
        anchors.leftMargin: 10
    }

    Button {
        id: btnCancel
        y: 156
        width: 60
        text: qsTr("Cancel")
        anchors.left: btnOK.right
        anchors.leftMargin: 10
    }
}
