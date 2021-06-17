import QtQuick 2.4
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

Page{  //СТРАНИЦА ДЛЯ Lab3 - HTTP-ЗАПРОСЫ
    id: page03
    Connections{
        target: WebAppController // объект - источник сигнал
        function onSignalSendToQML(pString, miniReply)
        {
            textarea.append(pString);
            textField.text = miniReply;
        }
    }
    header: Rectangle {   //header
        id: headerrowpage3
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
                text: qsTr("<b>Запросы к серверу по протоколу HTTP/HTTPS</b>")
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

    GridLayout {
            id: siteWeather

            anchors.fill: parent
            columns: 1
            rows: 3

            Flickable {
                id: flickable

                Layout.fillHeight: true
                Layout.fillWidth: true
                TextArea.flickable: TextArea {
                    id: textarea

                    textFormat: Text.RichText/*Text.PlainText*/
                    // Text.RichText // для вывода как в веб-версии
                    wrapMode: TextArea.Wrap

                    background: Rectangle {
                        id: rectangle
                        anchors.fill: parent
                        color: "#fff"
                        Image {
                            id: helloImage
                            anchors.fill: parent
                            source: "img/weather_bg.jpg"

                        }
                    }
                    readOnly: true



                    BusyIndicator {
                        id: busyIndicator
                        anchors.centerIn: parent
                        running: false

                    }

                }

                ScrollBar.vertical: ScrollBar { }
            }

            Button {
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("<b>Узнать погоду</b>")
                font.pixelSize: 12
                Material.background: "#5181b8"
                Material.foreground: "#fff"
                onClicked: {
//                    helloImage.destroy()
                    helloImage.visible = false;
                    textarea.clear();
                    rectangle.color = "#5181b8" // фон во время загрузки данных
                    textField.text = "загрузка..."


                    signalMakeRequestHTTP();
                    rectangle.color = "#fff" // фон после парсинга

                }
            }

            TextField {
                id: textField
                Layout.alignment: Qt.AlignHCenter
                horizontalAlignment: TextInput.AlignHCenter
                color: "#5181b8"
                font.pixelSize: 17

                readOnly: true
            }

        }


}

