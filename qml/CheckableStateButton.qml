import QtQuick 2.0
import QtQuick.Controls 2.0

Rectangle {
    id: checkableStateButton
    state: "Checked"
    property bool checked
    property color checkedColor: "cyan"
    property color uncheckedColor: "lightgray"
    property color pressedColor: "white"
    property color labelColor: "black"
    property string lblText: ""
    border.width: 1
    border.color: "gray"
    function changeCheckedStatus(newStatus) {
        if( newStatus == true ) {
            checkableStateButton.state = "Checked"
        } else {
            checkableStateButton.state = "UnChecked"
        }
    }

    states: [
        State {
            name: "Checked"
            PropertyChanges {
                target: checkableStateButton
                color: "#16ff64"
                checked: true
            }
            PropertyChanges {
                target: checkableStateButton
                color: checkedColor
            }
        },
        State {
            name: "UnChecked"
            PropertyChanges {
                target: checkableStateButton
                checked: false
            }
            PropertyChanges {
                target: checkableStateButton
                color: uncheckedColor
            }
        },
        State {
            name: "Pressed"
            PropertyChanges {
                target: checkableStateButton
                color: pressedColor
            }
            PropertyChanges {
                target: checkableStateButton
                checked: checked
            }
        }
    ]

    MouseArea {
        anchors.fill: parent
        onPressed: checkableStateButton.state = "Pressed"
        onReleased: {
                checkableStateButton.state = "Checked"
        }
        Label {
            id: label1
            text: checkableStateButton.lblText
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

}
