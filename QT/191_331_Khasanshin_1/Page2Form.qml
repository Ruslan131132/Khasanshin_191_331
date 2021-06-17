import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.12
import QtMultimedia 5.14 //для камеры
import QtQuick.Dialogs 1.0//для прикрпеления файла

Page{  //СТРАНИЦА ДЛЯ ВТОРОЙ ЛАБОРАТОРНОЙ - СЪЕМКА И ВОСПРОИЗВЕДЕНИЕ ВИДЕО


    id: page02
    header: Rectangle {                             //header
        id: headerrowpage2
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
                source: "img/vkontakte.png"             // vk.png
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
                text: qsTr("<b>Запись и воспроизведение фото и видео</b>")
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
                source: "img/icon.png"     // loads cat.png
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




    RowLayout{
        id: rowforradio
        spacing: 50
        anchors.top: parent.top
        anchors.topMargin: 20
        height: 40
        anchors.horizontalCenter: parent.horizontalCenter

        RadioButton{
            id: radio1
//            text: "Камера"
            checked: true
            onClicked: {
                page1.visible = true
                page2.visible = false
            }
            indicator: Rectangle {
                    implicitWidth: 20
                    implicitHeight: 20
                    x: radio1.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 10
                    border.color: radio1.down ? "#6792c0" : "#5181b8"
                    border.width: 3

                    Rectangle {
                        width: 10
                        height: 10
                        x: 5
                        y: 5
                        radius: 5
                        color: radio1.down ? "#6792c0" : "#5181b8"
                        visible: radio1.checked
                    }
                }

            Label
                {
                text:  qsTr("Камера")
                font.family: "Arial"
                font.pointSize: 15
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: 40
            }
        }

        RadioButton{
            id: radio2
//            text: "Фотопоток"
            onClicked: {
                page1.visible = false
                page2.visible = true
            }
            indicator: Rectangle {
                    implicitWidth: 20
                    implicitHeight: 20
                    x: radio2.leftPadding
                    y: parent.height / 2 - height / 2
                    radius: 10
                    border.color: radio2.down ? "#6792c0" : "#5181b8"
                    border.width: 3

                    Rectangle {
                        width: 10
                        height: 10
                        x: 5
                        y: 5
                        radius: 5
                        color: radio2.down ? "#6792c0" : "#5181b8"
                        visible: radio2.checked
                    }
                }

            Label
                {
                text:  qsTr("Видео")
                font.family: "Arial"
                font.pointSize: 15
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: 50
            }
        }
    }

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: rowforradio.bottom
        anchors.bottom: parent.bottom
        anchors.verticalCenter: parent.verticalCenter
        border.color: "#5181b8"
//        border.width: 2

        Item{  //СТРАНИЦА С КАМЕРОЙ
            id: page1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rowforradio.bottom
            anchors.bottom: parent.bottom
            anchors.verticalCenter: parent.verticalCenter

            Camera{
                id: camera
                imageCapture{
                    onImageCaptured: {
                        photoPreview.source = preview
                    }
                }
            }

            VideoOutput{
                id: photocam
                source: camera  //показывает на экране во время записи
                anchors.left: page1.left
                anchors.right: page1.right
                anchors.top: rowforradio.bottom
                anchors.bottom: page1.bottom
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                anchors.bottomMargin: 10
                anchors.verticalCenter: parent.verticalCenter

                Image {
                    id: photoPreview
                    height: 40
                    width: 75
                    anchors.right: parent.right

                    MouseArea {
                        anchors.fill: parent;
                        onClicked: photoPreview.width = 355, photoPreview.height = 190
                        onDoubleClicked: photoPreview.width = 75, photoPreview.height = 40
                    }
                }
            }
            RowLayout{
                id: rowforbnt
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: photocam.bottom
                anchors.bottomMargin: 50

                RoundButton{
                    id: capturebutton
                    Material.background: "grey"
                    text: "C"
                    onClicked: camera.imageCapture.captureToLocation("/Users/ruslan/Desktop/QT/Photos")
                }

                RoundButton {
                    id: videobutton
                    Material.background: "red"
                    text: "R"
                    onClicked:
                        if(camera.videoRecorder.StoppedState)
                            сamera.videoRecorder.stop()
                        else
                            camera.videoRecorder.record()
                }
            }
        }
    }

    Item{  //страница с просмотром видео
        id: page2
        visible: false
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: rowforradio.bottom
        anchors.bottom: parent.bottom

        Button {
            id: btnfordialoglab2
            anchors.horizontalCenter: parent.horizontalCenter
//                        font.pixelSize: 15
//                        anchors.top: page2.top
//                        anchors.topMargin: 20
//                        anchors.leftMargin: 10
////                        Material.foreground: "white"
//                        flat: true
            text: qsTr("<b>Открыть видео</b>")
            width: parent.width/3

            contentItem: Text {
                text: btnfordialoglab2.text
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
                color: btnfordialoglab2.down ? "#6792c0" : "#5181b8"
                border.color: "#5181b8"
                border.width: 1
                radius: 3
            }
            onClicked: fileDialog.open()

            FileDialog {
                id: fileDialog
                folder: shortcuts.home
                nameFilters: [ "Music files (*.mp4 *.avi *.mkv *.mov)"]

            }
        }

        Rectangle{
            id: rectangleforvideo
            anchors.left: page2.left
            anchors.right: page2.right
            anchors.top: btnfordialoglab2.bottom
            anchors.bottom: page2.bottom
            anchors.leftMargin: 3
            anchors.rightMargin: 3
//                        radius: 7
            color: "#5181b8"
//                        gradient: Gradient {
//                            GradientStop { position: 1.0; color: "#094A6F" }
//                            GradientStop { position: 0.6; color: "#64C8BD" }
//                        }

            MediaPlayer {
                id: player
                source: if (fileDialog.fileUrl == 0) "video.avi"; else fileDialog.fileUrl
                autoPlay: true
                volume: 0
                loops: 5
            }

            VideoOutput {
                id: videoOutput
                source: player
                anchors.left: rectangleforvideo.left
                anchors.right: rectangleforvideo.right
                anchors.top: btnfordialoglab2.bottom
                anchors.bottom: sliderforvideo.bottom
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                anchors.bottomMargin: 45
                anchors.verticalCenter: rectangleforvideo.verticalCenter
            }

            Slider{
                id:sliderforvideo
                visible: false
                Material.accent: "#ffffff"
                value: player.position
                to: player.duration
                anchors.left: videoOutput.left
                anchors.bottom: rectangleforvideo.bottom
                anchors.bottomMargin: 20
                anchors.horizontalCenter: videoOutput.horizontalCenter
                onPressedChanged: {
                    player.seek(sliderforvideo.value)
                }
            }

            MouseArea {
                anchors.fill: videoOutput
                id: areaforvideolab2
                onClicked:
                    bntplayorstop.visible = true, sliderforvideo.visible = true, timerforguivideo.start()

                Button {
                    id: bntplayorstop
                    flat: true
                    anchors.horizontalCenter: areaforvideolab2.horizontalCenter
                    anchors.verticalCenter: areaforvideolab2.verticalCenter
                    icon.color: "white"
                    icon.height: 55
                    visible: false
                    icon.width: 55
                    icon.source:
                        player.playbackState == MediaPlayer.PlayingState ? "img/Pause.png" : "img/Play.png"
                    onClicked:
                        player.playbackState == MediaPlayer.PlayingState ? player.pause() : player.play(), timerforguivideo.restart()
                }
            }

                Timer {
                    id: timerforguivideo
                    interval: 5000; running: true; repeat: true
                    onTriggered: bntplayorstop.visible = false, sliderforvideo.visible = false
                }
        }
    }





}
