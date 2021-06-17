import QtQuick 2.12
import QtQuick.Controls 2.5
import QtWebView 1.14

Page{
    id: page04
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
                text: qsTr("<b>Аутентификация OAuth2</b>")
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


    WebView {
        id: browserlab4
        anchors.fill: parent
        anchors.bottomMargin: 50

        onLoadingChanged: {
            console.info(browserlab4.url + " current url")
            var token = WebAppController.auth(browserlab4.url)
            var tokenbool = WebAppController.authbool(browserlab4.url)

            browserlab4.visible = token === " " ? true : false;
            btngettoken.visible = token === " " ? false : true;
            labelfortoken.text = token
            token1 = token
            labelfortoken.color = tokenbool === true ? "black" : "#FF0000"
            labelsucsesslab4.visible = tokenbool === true ? true : false
//            console.info(token + " -token- " + tokenbool)
            var gfdfgdfgf = WebAppController.requestReceivingAPI(token)
//            labelfortoken.text = gfdfgdfgf
        }
    }

    Label {
        id: labelfortoken
        anchors.bottom: btngettoken.top
        anchors.bottomMargin: 170
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "SF UI Display"
        font.pixelSize: 16
    }

    Label {
        id: labelsucsesslab4
        anchors.bottom: btngettoken.top
        anchors.bottomMargin: 250
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "SF UI Display"
        font.pixelSize: 21
        text: "Успешно! Ваш токен:"
        color: "#77BD8B"
    }

    Label {
        id: labelnosucsesslab4
        visible: true
//        anchors.bottom: btngettoken.top
        anchors.bottomMargin: 150
//        anchors.left: btngettoken.left
        anchors.centerIn: parent
        font.family: "SF UI Display"

//        text: qsTr("Чтобы получить доступ \nк вашм фото на ") + qsTr("Я") + qsTr("ндекс Диске, \nвойдите в аккаунт.")
        background: Rectangle {
            anchors.leftMargin: 0
//            anchors.fill: parent
            anchors.centerIn: parent
            width: 400;
            height: 100
            color: "#ffcc01"
            radius: 6
            Row {
                anchors.centerIn: parent
                Text { font.pointSize: 24; text: qsTr("Войдите через ") }
                Text { font.pointSize: 24; text: qsTr("Я"); color: "#fc3f1d"}
                Text { font.pointSize: 24; text: qsTr("ндекс Диск.") }
            }
        }
    }

    Button {
        id:btngettoken
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("<b>Получить токен</b>")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 130


        onClicked: {
//            browserlab4.url = "https://connect.ok.ru/oauth/authorize?client_id=512000563471&scope=VALUABLE_ACCESS;LONG_ACCESS_TOKEN&response_type=token&redirect_uri=https://apiok.ru/oauth_callback"
            browserlab4.url = "https://oauth.yandex.ru/authorize?response_type=token"
                    +"&client_id=44ca765a69e3423ea111a4e80f9f0554"
                    +"&device_id=123456546546"
                    +"&device_name=phone"
                    +"&redirect_uri=https://oauth.yandex.ru/verification_code"
                    +"&force_confirm=yes"
                    +"&state=get_token"/*
                    +"&display=popup"*/,
            labelnosucsesslab4.visible = false
            browserlab4.visible = true
            this.visible = false
            backbutton.visible = true
        }

        contentItem: Text {
            text: btngettoken.text
            font.family: "Arial"
            font.pointSize: 14
            opacity: enabled ? 1.0 : 0.3
//            color: "#ffffff"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 40
            opacity: enabled ? 1 : 0.3
            color: btngettoken.down ? "#c9ad3d" : "#ffcc01"
            border.color: "#ffcc01"
            border.width: 1
            radius: 3
        }
    }

    Button {
        id:backbutton
        anchors.bottom: parent.bottom
//        anchors.left: parent.left
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("<b>Назад</b>")
        visible: false

        onClicked: {
            this.visible = false
            browserlab4.visible = false
            btngettoken.visible=true
            labelnosucsesslab4.visible = true
        }


        contentItem: Text {
            text: backbutton.text
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
            color: backbutton.down ? "#6792c0" : "#5181b8"
            border.color: "#5181b8"
            border.width: 1
            radius: 3
        }
    }





    //            Rectangle{
    //                width: parent.width-40;
    //                height: 100
    //                anchors.centerIn: parent

//                    Button {
//                        id: mainbuttonp3
//                        text: qsTr("<b>Авторизация</b>")
//                        width: parent.width/3


//                        onClicked: {
//                          var popupComponent = Qt.createComponent("qrc:/authPage.qml")
//                          var popup2 = popupComponent.createObject(mainbuttonp3);
//                          popup2.open()
//                        }

//                        contentItem: Text {
//                            text: mainbuttonp3.text
//                            font.family: "Arial"
//                            font.pointSize: 14
//                            opacity: enabled ? 1.0 : 0.3
//                            color: "#ffffff"
//                            horizontalAlignment: Text.AlignHCenter
//                            verticalAlignment: Text.AlignVCenter
//                            elide: Text.ElideRight
//                        }

//                        background: Rectangle {
//                            implicitWidth: 100
//                            implicitHeight: 40
//                            opacity: enabled ? 1 : 0.3
//                            color: mainbuttonp3.down ? "#6792c0" : "#5181b8"
//                            border.color: "#5181b8"
//                            border.width: 1
//                            radius: 3
//                        }
//                         anchors.centerIn: parent
//                    }










}
