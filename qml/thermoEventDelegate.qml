import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {
    id: thermoEventDelegate
    height: 30

    property string degreeMark: String.fromCharCode(176)

    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#8cffffff"
        }

        GradientStop {
            position: 1
            color: "#8c000000"
        }
    }
    border.color: "#808080"

    Label {
        id: eventTime
        property string timeStr: "10:00AM"
        text: timeStr
        textFormat: Text.AutoText
        font.bold: true
        font.pointSize: 12
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
    }

    Rectangle {
        id: line1
        width: 2
        color: "#000000"
        anchors.leftMargin: 3
        anchors.left: eventTime.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }

    Label {
        id: eventCoolingState
        property string coolingStateStr: "HEAT"
        Text {
            id: coolingText
            color: "#ff0000"
            text: eventCoolingState.coolingStateStr
            anchors.fill: parent
            font.bold: true
            font.pointSize: 12
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }
        anchors.left: line1.left
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
    }

    Rectangle {
        id: line2
        width: 2
        color: "#000000"
        anchors.leftMargin: 3
        anchors.left: eventCoolingState.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }

    Label {
        id: eventFanState
        property string fanStateStr: "AUTO"
        text: fanStateStr
        textFormat: Text.AutoText
        font.bold: true
        font.pointSize: 12
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        anchors.left: line2.left
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
    }

    Rectangle {
        id: line3
        width: 2
        color: "#000000"
        anchors.leftMargin: 3
        anchors.left: eventFanState.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }

    Label {
        id: eventTargetTemp
        property string targetTempStr: "70"
        text: targetTempStr+thermoEventDelegate.degreeMark
        textFormat: Text.AutoText
        font.bold: true
        font.pointSize: 12
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        anchors.left: line3.left
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter
    }

    Rectangle {
        id: line4
        width: 2
        color: "#000000"
        anchors.leftMargin: 3
        anchors.left: eventTargetTemp.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }
}
