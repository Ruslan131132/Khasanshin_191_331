import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4


import QtQuick.Controls.Material 2.12
//import QtQuick.Layouts 1.12
import QtMultimedia 5.14 //для камеры
import QtQuick 2.0
import QtQuick 2.14
import QtMultimedia 5.4
import QtGraphicalEffects 1.14
import QtQuick.Window 2.12
//import QtQuick 2.2
import QtQuick.Dialogs 1.0
import QtQml 2.14
import QtWebView 1.14
import QtCharts 2.0
import QtWebSockets 1.1


ApplicationWindow {
    signal signalMakeRequestHTTP();
    property string token1: ""
    id:mainWindow
    width: 563
    height: 1000
    visible: true
    title: qsTr("Tabs")



    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex


        Page1Form { //Lab 1

        }//Page1

//        Page2Form { //Lab 2

//        }

        Page3Form{ //Lab3

        }
        Page4Form{ //Lab4

        }
        Page5Form{ //Lab5 - RestAPI

        }
//        Page6Form{ //Lab6 - Шифрование

//        }


    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex


//        background: Rectangle {
//            id: bordertop
//            height: 2
//                color: "#5181b8"
//            anchors.top: parent.top
//            anchors.left: parent.left
//            anchors.right: parent.right

//        }


        TabButton {
//            id: buttonLab1

            Text {
                id: name
                text: qsTr("LAB 1")
                color: tabBar.currentIndex == 0 ? "#5181b8" : "black"
                anchors.centerIn: parent
            }
//            background: Rectangle {
//                //                color: "#5181b8"
//                 height: 2
//                 anchors.top: parent.top
//                 anchors.left: parent.left
//                 anchors.right: parent.right
//                 color: tabBar.currentIndex == 0 ? "#5181b8" : "white"

//            }


        }
//        TabButton {
//            text: qsTr("LAB 2")
//        }
        TabButton {
            text: qsTr("LAB 3")
        }
        TabButton {
            text: qsTr("LAB 4")
        }
        TabButton {
            text: qsTr("LAB 5")
        }
        TabButton {
            text: qsTr("LAB 6")
        }

    }
}
