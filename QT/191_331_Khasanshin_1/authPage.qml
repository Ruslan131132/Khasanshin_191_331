import QtQuick.Window 2.2
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4
import QtQuick 2.12
import QtQuick.Controls 2.5
import QtWebView 1.14

Popup {
    id: popup1
//    x: 100
//    y: 100
    anchors.centerIn: parent
    width: 500
    height: 700
    modal: true
    focus: true
    closePolicy: /*Popup.NoAutoClose*/ CloseOnEscape | Popup.CloseOnPressOutsideParent
    visible: false

    Button {
        id: mainbuttonp2
        visible: true
        text: qsTr("<b>Close</b>")
        width: 100
        height: 50
        anchors.left: parent.left
        anchors.top: parent.top

        onClicked: {

          popup1.close()
        }


        contentItem: Text {
            text: qsTr("<b>Close</b>")
            font.family: "Arial"
            font.pointSize: 14
            opacity: enabled ? 1.0 : 0.3
            color: "#ffffff"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 40
            opacity: enabled ? 1 : 0.3
            color: mainbuttonp3.down ? "#6792c0" : "#5181b8"
            border.color: "#5181b8"
            border.width: 1
            radius: 3
        }
    }




}
