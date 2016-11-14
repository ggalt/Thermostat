import QtQuick 2.7
import QtQuick.Controls 2.0 as NewControls
import QtQuick.Layouts 1.1 as QtLayouts
import QtQuick.Controls 1.4 as OldControls
import QtQuick.Extras 1.4


Rectangle {
    id: thermostatEventRec
    width: 320
    height: 240
    property string degreeMark: String.fromCharCode(176)

    property alias dayOfWeek: tmblDayOfWeek.dayResult
    property alias hour: tmblHour.hourResult
    property alias minute: tmblMinute.minuteResult
    property alias targetTemp: sliderTemp.value
    property int fanState
    property int heatState

    signal accepted()
    signal cancelled()

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

    FontLoader {
        id: openSans
        source: "qrc:/fonts/OpenSans-Regular.ttf"
     }

    function acceptData() {
        /// set target temperature
        thermostatEvent.setTargetTemp(thermostatEventRec.targetTemp)
        console.log("Target temp is:", targetTemp)
        console.log("Fan state is:", fanState)
        console.log("Heat state is:", heatState)


        /// FAN
        if(fanState==1) // fan is set to "ON"
            thermostatEvent.setFanState(thermostatEvent.FanOn)
        else            // fans is set o "AUTO"
            thermostatEvent.setFanState(thermostatEvent.FanAuto)

        /// AC / HEAT
        if(heatState==1)    // AC is ON
            thermostatEvent.setCoolingState(thermostatEvent.Cool)
        else                // HEAT is ON
            thermostatEvent.setCoolingState(thermostatEvent.Heat)

        // DAY OF WEEK
        console.log("Entering switch statement with day of week set to:", dayOfWeek)
        switch (dayOfWeek) {
            case "SUN": {
                thermostatEvent.setDayOfTheWeek(thermostatEvent.Sunday)
            }
            break;
            case "MON": {
                thermostatEvent.setDayOfTheWeek(thermostatEvent.Monday)
            }
            break;
            case "TUE": {
                thermostatEvent.setDayOfTheWeek(thermostatEvent.Tuesday)
            }
            break;
            case "WED": {
                thermostatEvent.setDayOfTheWeek(thermostatEvent.Wednesday)
            }
            break;
            case "THUR": {
                thermostatEvent.setDayOfTheWeek(thermostatEvent.Thursday)
            }
            break;
            case "FRI": {
                thermostatEvent.setDayOfTheWeek(thermostatEvent.Friday)
            }
            break;
            case "SAT": {
                thermostatEvent.setDayOfTheWeek(thermostatEvent.Saturday)
            }
            break;
            case "ALL": {
                thermostatEvent.setDayOfTheWeek(thermostatEvent.AllWeek)
            }
            break;
            case "WKND": {
                thermostatEvent.setDayOfTheWeek(thermostatEvent.Weekend)
            }
            break;
            case "WDYS": {
                thermostatEvent.setDayOfTheWeek(thermostatEvent.WeekDays)
            }
            break;
        }
        console.log("day of week", dayOfWeek)
        thermostatEventRec.accepted()
    }

    OldControls.Slider {
        id: sliderTemp
        x: 0
        y: 206
        width: 320
        height: 26
        minimumValue: 40
        maximumValue: 100
        value: 70
        stepSize: 1
        updateValueWhileDragging: true
    }

    NewControls.Label {
        id: lblTargetTemp
        readonly property int minValue: 40
        readonly property int maxValue: 100
        property alias m_targetTemp: sliderTemp.value
        x: 206
        y: 107
        width: 106
        height: 85
        text: m_targetTemp + thermostatEventRec.degreeMark+"F"
        anchors.bottom: sliderTemp.top
        anchors.bottomMargin: 5
        font.pointSize: 40
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    NewControls.Button {
        id: btnOK
        y: 156
        width: 60
        text: qsTr("Accept")
        anchors.left: parent.left
        anchors.leftMargin: 10
        onClicked: thermostatEventRec.acceptData()
    }

    NewControls.Button {
        id: btnCancel
        y: 156
        width: 60
        text: qsTr("Cancel")
        anchors.left: btnOK.right
        anchors.leftMargin: 10
        onClicked: thermostatEventRec.cancelled()
    }

    Tumbler {
        id: tmblEventTime
        height: 130
        anchors.left: parent.left
        anchors.leftMargin: 2
        anchors.top: parent.top
        anchors.topMargin: 6

        readonly property real delegateTextMargins: characterMetrics.width * 1.5

        OldControls.Label {
            id: characterMetrics
            font.bold: true
            font.family: openSans.name
            visible: false
            text: "M"
        }


        TumblerColumn {
            id: tmblDayOfWeek
            width: characterMetrics.width * 3 + tmblEventTime.delegateTextMargins
            model: ["SUN","MON","TUE","WED","THUR","FRI","SAT","ALL","WKND","WDYS"]
            property string dayResult: tmblDayOfWeek.model[currentIndex]
        }

        TumblerColumn {
            id: tmblHour
            width: characterMetrics.width * 5 + tmblEventTime.delegateTextMargins
            model: ["00AM:","01AM:","02AM:","03AM:","04AM:","05AM:","06AM:","07AM:","08AM:","09AM:","10AM:","11AM:",
                    "12PM:","01PM:","02PM:","03PM:","04PM:","05PM:","06PM:","07PM:","08PM:","09PM:","10PM:","11PM:"]

            property string hourResult: tmblHour.model[currentIndex]
        }

        TumblerColumn {
            id: tmblMinute
            width: characterMetrics.width * 2 + tmblEventTime.delegateTextMargins
            model: ["00","05","10","15","20","25","30","35","40","45","50","55"]
            property string minuteResult: tmblMinute.model[currentIndex]
        }
    }

    NewControls.Frame {
        id: frame1
        x: 170
        width: 123
        anchors.bottom: lblTargetTemp.top
        anchors.bottomMargin: 3
        anchors.right: parent.right
        anchors.rightMargin: 3
        anchors.top: parent.top
        anchors.topMargin: 3

        NewControls.Frame {
            id: fanFrame
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            padding: 0
            leftPadding: 0

            CheckableStateButton {
                id: btnFanAuto
                checkedColor: qsTr("darkCyan")
                uncheckedColor: qsTr("lightgrey")
                pressedColor: qsTr("white")
                anchors.right: parent.horizontalCenter
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                lblText: "Auto"
                anchors.bottom: parent.bottom
                onCheckedChanged: {
                    btnFanOn.changeCheckedStatus(!btnFanAuto.checked)
                    if( btnFanAuto.checked)
                        fanState = 2
                }
            }

            CheckableStateButton {
                id: btnFanOn
                checked: false
                checkedColor: qsTr("darkCyan")
                uncheckedColor: qsTr("lightgrey")
                pressedColor: qsTr("white")
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.horizontalCenter
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                lblText: "On"
                anchors.bottom: parent.bottom
                onCheckedChanged: {
                    btnFanAuto.changeCheckedStatus(!btnFanOn.checked)
                    if( btnFanOn.checked)
                        fanState = 1
                }
            }

        }

        NewControls.Frame {
            id: frame2
            anchors.top: parent.verticalCenter
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            padding: 0
            leftPadding: 0
            bottomPadding: 0

            CheckableStateButton {
                id: btnHeat
                checkedColor: qsTr("red")
                uncheckedColor: qsTr("lightgrey")
                pressedColor: qsTr("white")
                anchors.right: parent.horizontalCenter
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                lblText: "Heat"
                anchors.bottom: parent.bottom
                onCheckedChanged: {
                    btnAC.changeCheckedStatus(!btnHeat.checked)
                    if( btnHeat.checked)
                        heatState = 0
                }
            }

            CheckableStateButton {
                id: btnAC
                checked: false
                checkedColor: qsTr("cyan")
                uncheckedColor: qsTr("lightgrey")
                pressedColor: qsTr("white")
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.horizontalCenter
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                lblText: "AC"
                anchors.bottom: parent.bottom
                onCheckedChanged: {
                    btnHeat.changeCheckedStatus(!btnAC.checked)
                    if(btnAC.checked)
                        heatState = 1
                }
            }
        }
    }
}
