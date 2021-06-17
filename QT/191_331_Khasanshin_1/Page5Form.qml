import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.15

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
                text: qsTr("<b>Запросы по REST API</b>")
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



    ListView{
        model: filemodel
        id: listrest
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: rowforrest.top
        anchors.bottomMargin: 50
        spacing: 100
        anchors.topMargin: 25

        delegate: Rectangle{
            height: Screen.pixelDensity * 20
            width: listrest.width

            GridLayout{
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: rowforrest.top

                Image {
                    id: imageforrest
                    source: preview
                    sourceSize.width: 100
                    sourceSize.height: 100
                    anchors.left: parent.left
                    anchors.leftMargin: 10

                }

                Label{
                    id: nameforrest
                    text: name
                    font.pixelSize: 20
                    anchors.top: imageforrest.top
                    anchors.left: imageforrest.right
                    anchors.leftMargin: 10
                    font.family: "SF UI Display Bold"
                    font.pointSize: 18

                }

                Label{
                    id: sizeforrest
                    text: size + " бит"
                    font.pixelSize: 13
                    font.family: "SF UI Display"
                    anchors.left: imageforrest.right
                    anchors.leftMargin: 10
                    anchors.top: nameforrest.bottom
                    anchors.topMargin: 5

                }

                Label{
                    id: createdforrest
                    text: "Дата зарузки: " + created
                    font.pixelSize: 13
                    font.family: "SF UI Display"
                    anchors.left: sizeforrest.right
                    anchors.leftMargin: 10
                    anchors.top: nameforrest.bottom
                    anchors.topMargin: 5

                }
            }
        }
    }



    GridView{
        model: filemodel
        id: gridrest
        visible: false
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: rowforrest.top
        anchors.bottomMargin: 120
        anchors.topMargin: 30
        anchors.leftMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        cellWidth: 180
        cellHeight: 180

        delegate: Column {
            Image {
                source: preview
                sourceSize.width: 150
                sourceSize.height: 150
            }

            Label{
                text: name
                font.pixelSize: 17
            }

            Label{
                text: size + " байт"
                font.pixelSize: 13
                font.family: "SF UI Display"
            }

            Label{
                text: "Дата зарузки: " + created
                font.pixelSize: 13
                font.family: "SF UI Display"
            }
        }
    }

    Label{
        id: noaccesslab5
        font.pixelSize: 17
        font.family: "SF UI Display"
        anchors.centerIn: parent
        lineHeight: 1.5
        text: "Необходимо дать приложению \nправа на чтение Яндекс Диска \nдля вывода актуального списка фото."
        visible: if (filemodel.rowCount() > 0 || token1 =="") false; else true
    }

    RowLayout{
        id: rowforrest
        spacing: 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        height: 40
        Material.background: "black"
        anchors.horizontalCenter: parent.horizontalCenter

        Button {
            id: btnforspisok
//            flat: true
            text: "Cписок"
            height: 150
            width: 150
            onClicked: if (filemodel.rowCount() > 0) gridrest.visible = false, listrest.visible = true, noaccesslab5.visible = false; else noaccesslab5.visible = true
        }

        Button {
                id: btnforplitki
//                flat: true
                text: "Плитки"
                height: 150
                width: 150
                onClicked: if (filemodel.rowCount() > 0) gridrest.visible = true, listrest.visible = false, noaccesslab5.visible = false; else noaccesslab5.visible = true
        }

        Button {
                    id: btnforreload
//                    flat: true
                    text: "Обновить"
                    height: 150
                    width: 150
                    onClicked: if (token1 != 0) listrest.visible = true, gridrest.visible = false, noaccesslab5.visible = false, WebAppController.requestReceivingAPI(token1); else noaccesslab5.visible = true, listrest.visible = false, gridrest.visible = false
        }
     }

}
