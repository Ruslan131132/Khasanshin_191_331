import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.15
//import com.myapp.demo 1.0

Page{
    id: page05
    header: Rectangle {   //header
        id: headerrowpage4
        color: "#5181b8"
        width: parent.width
        height: 50
        anchors.margins: 0

        Rectangle {
            height: 0.5
            color: "grey"
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
        }


        Item{
            width: 100
            id: item1

            Image {
                source: "img/vkontakte.png"     // vk.png
                width: parent.width/3
                height: parent.width/3
                anchors.centerIn: parent
            }
            anchors.verticalCenter: parent.top
            anchors.horizontalCenter: parent.left
            anchors.verticalCenterOffset: parent.height/2
            anchors.horizontalCenterOffset: this.width/2-20
        }

        Item{
            id: item2
            width: parent.width/1.5
            Text {
                id: texthead22
                text: qsTr("<b>Шифрование данных</b>")
                font.family: "Arial"
                font.pointSize: 13
                color: "white"
                anchors.centerIn: parent
            }
            anchors.centerIn: parent
         }

         Item{
            id: item3
            width: 100
            Image {
                source: "img/icon.png"
                width: parent.width/4
                height: parent.width/4
                anchors.centerIn: parent
            }
            anchors.verticalCenter: parent.top
            anchors.horizontalCenter: parent.right
            anchors.verticalCenterOffset: parent.height/2
            anchors.horizontalCenterOffset: -this.width/2+20
         }
    }


//    AES{
//           id: aes
//       }
       Button {
                    id: btnaes
    //                    flat: true
                    text: "Обновить"
                    height: 150
                    width: 150
//                    onClicked: AES.encrypt(qsTr("testing encryption"), qsTr("secretKey"))
        }
       /* call invokable method */
//       Component.onCompleted: {
//           console.info(aes.docrypt("testing encryption", "secretKey"))
//       }


}
