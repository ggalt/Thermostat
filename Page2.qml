import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Rectangle {
    id: rectangle1
    height: 240
    width: 320
    gradient: Gradient {
        GradientStop {
            position: 0.00;
            color: "#ffffff"
        }
        GradientStop {
            position: 0.50;
            color: "#0066ff"
        }
        GradientStop {
            position: 1.00;
            color: "#f0f0f0";
        }
    }

    function uncheckDays() {
        btnSaturday.highlighted = false;
        btnSunday.highlighted = false;
        btnMonday.highlighted = false;
        btnTuesday.highlighted = false;
        btnWednesday.highlighted = false;
        btnThursday.highlighted = false;
        btnFriday.highlighted = false;
    }

    ToolBar {
        id: toolBar1
        x: 0
        y: 0
        width: 320
        height: 45
        opacity: 1

        ToolButton {
            id: btnSunday
            width: 45
            height: 45
            text: qsTr("SU")
            highlighted: true
            autoExclusive: true
            anchors.left: parent.left
            anchors.leftMargin: 2
            anchors.top: parent.top
            anchors.topMargin: 0
            onClicked: {
                uncheckDays();
                highlighted = true;
            }
        }

        ToolButton {
            id: btnMonday
            width: 45
            height: 45
            text: qsTr("MO")
            highlighted: false
            autoExclusive: true
            anchors.left: btnSunday.right
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            onClicked: {
                uncheckDays();
                highlighted = true;
            }
        }

        ToolButton {
            id: btnTuesday
            width: 45
            height: 45
            text: qsTr("TU")
            highlighted: false
            autoExclusive: true
            anchors.left: btnMonday.right
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            onClicked: {
                uncheckDays();
                highlighted = true;
            }
        }

        ToolButton {
            id: btnWednesday
            width: 45
            height: 45
            text: qsTr("WE")
            highlighted: false
            autoExclusive: true
            anchors.left: btnTuesday.right
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            onClicked: {
                uncheckDays();
                highlighted = true;
            }
        }

        ToolButton {
            id: btnThursday
            width: 45
            height: 45
            text: qsTr("Th")
            highlighted: false
            autoExclusive: true
            anchors.left: btnWednesday.right
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            onClicked: {
                uncheckDays();
                highlighted = true;
            }
        }

        ToolButton {
            id: btnFriday
            width: 45
            height: 45
            text: qsTr("FR")
            highlighted: false
            autoExclusive: true
            anchors.left: btnThursday.right
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            onClicked: {
                uncheckDays();
                highlighted = true;
            }
        }

        ToolButton {
            id: btnSaturday
            width: 45
            height: 45
            text: qsTr("SA")
            highlighted: false
            autoExclusive: true
            anchors.left: btnFriday.right
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            onClicked: {
                uncheckDays();
                highlighted = true;
            }
        }
    }
}
