import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1

Rectangle {
    id: page1Rectangle
    height: 240
    width: 320
    property string degreeMark: String.fromCharCode(176)

    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: "#F0F0F0"
        }
        GradientStop {
            position: 0.5
//            color: "#33ff00"
            color: Qt.hsla(0.3,1.0,0.5,1.0)
        }
        GradientStop {
            position: 1.0
            color: "#F0F0F0"
        }
    }

    Label {
        id: targetTemp
//        x: 294
        width: 40
        property int targetTempVal: swPage1.targetTemp

        text: targetTempVal+page1Rectangle.degreeMark
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        font.pointSize: 20
        horizontalAlignment: Text.AlignHCenter

        MouseArea {
            id: quickTempChange
            anchors.fill: parent
            onClicked: quickTempChangePopup.open()
        }
    }

    Label {
        id: targetTempLabel
//        x: 266
//        y: 11
        text: qsTr("Target:")
        anchors.verticalCenter: targetTemp.verticalCenter
        anchors.right: targetTemp.left
        anchors.rightMargin: 0
        font.pointSize: 20
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
    }

    Label {
        id: currentTemp
        property int currentTempVal: swPage1.curTemp
//        x: 152
//        y: 108
        text: currentTempVal+page1Rectangle.degreeMark+"F"
        font.pointSize: 80
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Label {
        id: currentTime
//        y: 227
        text: Qt.formatTime(new Date(), "hh:mm AP")
        font.pointSize: 18
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
    }

    Label {
        id: currentDate
//        x: 165
//        y: 207
        text: Qt.formatDate(new Date(),"MMM dd, yyyy")
        rightPadding: 2
        verticalAlignment: Text.AlignBottom
        horizontalAlignment: Text.AlignRight
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        leftPadding: 0
        font.pointSize: 18
    }

    Image {
        id: image1
        width: 80
        height: 80
        fillMode: Image.PreserveAspectFit
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        source: "../images/Sun-80.png"
    }

    Label {
        id: outsideTemp
        text: "70"+page1Rectangle.degreeMark
        font.pointSize: 18
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: image1.right
        anchors.leftMargin: 0
    }
 }
