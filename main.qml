import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: applicationWindow1
    visible: true
    width: 320
    height: 240

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 0

        Page1 {
        }

        Page2 {
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
}
