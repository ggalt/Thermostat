import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1

//ApplicationWindow {
Rectangle {
    id: mainWindow
    visible: true
    width: 320
    height: 240

    property alias currentTemp: swPage1.curTemp
    property alias targetTemp: swPage1.targetTemp

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 0

        Page1 {
            id:swPage1
            objectName: "swPage1"
            property int curTemp: 70
            property int targetTemp: 70
            property int curHumidity: 20
        }

        Page2 {
            id:swPage2
            objectName: "swPage2"
        }
        onCurrentIndexChanged: {
            pageIndicator.currentIndex = swipeView.currentIndex;
        }
    }
    PageIndicator {
        id: pageIndicator
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        count: 2
        currentIndex: 0
        anchors.verticalCenterOffset: top
    }
    Popup {
        id: quickTempChangePopup
        x: (mainWindow.width - width) / 2
        y: mainWindow.height/ 6
        width: Math.min(mainWindow.width, mainWindow.height) / 3 * 2
        height: settingsColumn.implicitHeight + topPadding + bottomPadding
        modal: true
        focus: true

        contentItem: ColumnLayout {
            id: settingsColumn
            spacing: 20

            Label {
                text: "Settings"
                font.bold: true
            }

            RowLayout {
                spacing: 10

                Label {
                    text: "Style:"
                }

                ComboBox {
                    id: styleBox
                    property int styleIndex: -1
                    model: ["Default", "Material", "Universal"]
                    Component.onCompleted: {
                        styleIndex = find(settings.style, Qt.MatchFixedString)
                        if (styleIndex !== -1)
                            currentIndex = styleIndex
                    }
                    Layout.fillWidth: true
                }
            }

            Label {
                text: "Restart required"
                color: "#e41e25"
                opacity: styleBox.currentIndex !== styleBox.styleIndex ? 1.0 : 0.0
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            RowLayout {
                spacing: 10

                Button {
                    id: okButton
                    text: "Ok"
                    onClicked: {
                        quickTempChangePopup.close()
                    }

//                    Material.foreground: Material.primary
//                    Material.background: "transparent"
//                    Material.elevation: 0

                    Layout.preferredWidth: 0
                    Layout.fillWidth: true
                }

                Button {
                    id: cancelButton
                    text: "Cancel"
                    onClicked: {
                        settingsPopup.close()
                    }

//                    Material.background: "transparent"
//                    Material.elevation: 0

                    Layout.preferredWidth: 0
                    Layout.fillWidth: true
                }
            }
        }

    }

}
