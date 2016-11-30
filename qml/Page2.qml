import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1

Rectangle {
    id: addEventMainRec
    objectName: "addEventMainRec"

    height: 240
    width: 320

//    function selectDay(string m_day) {
//        switch(m_day) {
//        case "SU": {
//            uncheckDays();
//            btnSunday.highlighted=true;
//            break;
//        }
//    }
//    }

    function addThermoEvent() {
        thermoObj.createNewThermoEvent()
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
        id: dayToolBar
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
                thermoObj.daySelected("SU")
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
                thermoObj.daySelected("MO")
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
                thermoObj.daySelected("TU")

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
                thermoObj.daySelected("WE")

            }
        }

        ToolButton {
            id: btnThursday
            width: 45
            height: 45
            text: qsTr("TH")
            highlighted: false
            autoExclusive: true
            anchors.left: btnWednesday.right
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            onClicked: {
                uncheckDays();
                highlighted = true;
                thermoObj.daySelected("TH")

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
                thermoObj.daySelected("FR")

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
                thermoObj.daySelected("SA")

            }
        }
    }

    Rectangle {
        id: dayEventsRec
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
        anchors.right: parent.right
        anchors.bottom: addToolBar.top
        anchors.top: dayToolBar.bottom
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        ListView {
            id: dayListView
            anchors.fill: parent
            delegate: thermoEventDelegate
            model: swPage2.eventModel
        }

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
        }
    }

    ToolBar {
        id: addToolBar
        height: 20
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom

        ToolButton {
            id: btnAdd
            objectName: "AddNewEvent"
            text: qsTr("Add New Event")
            anchors.right: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.top: parent.top
//            onClicked: addEventMainRec.addThermoEventSignal()
            onClicked: addEventMainRec.addThermoEvent()
        }
    }   // End dayEvents

}
