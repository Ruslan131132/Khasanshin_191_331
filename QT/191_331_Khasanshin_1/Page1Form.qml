import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.12
import QtQuick 2.15



Page{  //ПЕРВАЯ ЛАБОРАТОРНАЯ - ЭЛЕМЕНТЫ GUI
    id: page01
    scale: 1
    header: Rectangle {                             //header
        id: headerrowpage1
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
                text: qsTr("<b>Приложения Widgets и QML. Элементы GUI.</b>")
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

    Rectangle{
        id: body
        anchors.fill: parent
        border.color: "#5181b8"
        border.width: 3
//        radius: 7

        Rectangle{
            id: ofsettedbody
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width-40
            height: parent.height



            Rectangle{
                id: firstbodyrow
                width: parent.width-40;
                height: parent.height/7
                anchors.verticalCenter: parent.top
                anchors.horizontalCenter: parent.left
                anchors.verticalCenterOffset: headerrowpage1.height
                anchors.horizontalCenterOffset: this.width/2+20

                Item{
                width: parent.width/2
                id: item4

                        Text {
                            id: photoaccesstext
                            text: qsTr("<b>Разрешить доступ к фото</b>")
                            font.family: "Arial"
                            font.pointSize: 14
                            color: "#656565"
                            anchors.centerIn: parent.Center
                        }






                  anchors.verticalCenter: parent.top
                  anchors.horizontalCenter: parent.left
                  anchors.verticalCenterOffset: 20
                  anchors.horizontalCenterOffset: this.width/2

                }
                Item{
                    id: item5
                    width: parent.width/2





                    Column {
                        RadioButton {
                            id: firstradiobutton
                            checked: true


                            indicator: Rectangle {
                                    implicitWidth: 15
                                    implicitHeight: 15
                                    x: firstradiobutton.leftPadding
                                    y: parent.height / 2 - height / 2
                                    radius: 7.5
                                    border.color: firstradiobutton.down ? "#6792c0" : "#5181b8"

                                    Rectangle {
                                        width: 8
                                        height: 8
                                        x: 3.5
                                        y: 3.5
                                        radius: 4
                                        color: firstradiobutton.down ? "#6792c0" : "#5181b8"
                                        visible: firstradiobutton.checked
                                    }
                                }

                            Label
                                {
                                text:  qsTr("Всем")
                                font.family: "Arial"
                                font.pointSize: 13
                                anchors.centerIn: parent
                                anchors.horizontalCenterOffset: 30
                            }

                        }
                        RadioButton {
                            id: secondradiobutton




                            indicator: Rectangle {
                                    implicitWidth: 15
                                    implicitHeight: 15
                                    x: secondradiobutton.leftPadding
                                    y: parent.height / 2 - height / 2
                                    radius: 7.5
                                    border.color: secondradiobutton.down ? "#6792c0" : "#5181b8"

                                    Rectangle {
                                        width: 8
                                        height: 8
                                        x: 3.5
                                        y: 3.5
                                        radius: 4
                                        color: secondradiobutton.down ? "#6792c0" : "#5181b8"
                                        visible: secondradiobutton.checked
                                    }
                                }

                            Label
                                {
                                text:  qsTr("Друзьям")
                                font.family: "Arial"
                                font.pointSize: 13
                                anchors.centerIn: parent
                                anchors.horizontalCenterOffset: 40
                            }

                        }





                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    leftPadding: 30


                    }

                    anchors.top: parent.top
                    anchors.left: item4.right
                }


                Rectangle {
                    height: 1
                    color: "#e7e8ec"
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right

                }


            }




            Rectangle{
                id: secondbodyrow
                width: parent.width-40;
                height: parent.height/7
//                            color: "black"
                anchors.top: firstbodyrow.bottom
                anchors.horizontalCenter: firstbodyrow.horizontalCenter
//                            anchors.top: firstbodyrow.bottom
//                            anchors.
//                            anchors.verticalCenterOffset: firstbodyrow.height
//                            anchors.horizontalCenterOffset: 20

                Item{
                width: parent.width/2
                height: parent.height/3
                id: item6

                        Text {
                            id: emailchangetext
                            text: qsTr("<b>Электронная почта</b>")
                            font.family: "Arial"
                            font.pointSize: 14
                            color: "#656565"
                            anchors.centerIn: parent.Center
                        }






                  anchors.verticalCenter: parent.top
                  anchors.horizontalCenter: parent.left
                  anchors.verticalCenterOffset: 40
                  anchors.horizontalCenterOffset: this.width/2

                }



                Item{
                    id: item7
                    width: parent.width/2





                    Text {
                        id: oldemailtext
                        text: qsTr("test@mail.ru")
                        font.family: "Arial"
                        font.pointSize: 14
                        color: "black"
//                                    anchors.centerIn: parent.top
                    }


                    anchors.verticalCenter: item6.top
                    anchors.horizontalCenter: item6.right
//                                anchors.verticalCenterOffset: item6.height/2
                    anchors.horizontalCenterOffset: this.width/2+40
                }

                Item{
                width: parent.width/2
                id: item8

                        Text {
                            id: newemailchangetext
                            text: qsTr("<b>Новый адрес</b>")
                            font.family: "Arial"
                            font.pointSize: 14
                            color: "#656565"
                            anchors.centerIn: parent.Center
                        }




                        anchors.verticalCenter: item6.top
                        anchors.horizontalCenter: item6.left
                        anchors.verticalCenterOffset: item6.height
                        anchors.horizontalCenterOffset: this.width/2

//                              anchors.verticalCenter: item6.verticalCenter
//                              anchors.top: item6.bottom

                }

                Item{
                width: parent.width/2
                id: item9

                TextField {

                    placeholderText:  qsTr("Новая почта...")
                    maximumLength : parent.width-40
                    width: parent.width - 80
                    background : Rectangle {

                                radius : 3
                                height: 2*parent.height/3

                                implicitWidth : parent.width
                                implicitHeight : 24
                                border .color: "#d3d9de"
                                border .width: 1
                            }

                }



                        anchors.verticalCenter: item8.top
                        anchors.horizontalCenter: item8.right
//                                    anchors.verticalCenterOffset: item6.height
                        anchors.horizontalCenterOffset: this.width/2+40

//                              anchors.verticalCenter: item6.verticalCenter
//                              anchors.top: item6.bottom

                }



                Rectangle {
                    height: 1
                    color: "#e7e8ec"
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right

                }


            }




            Rectangle{
                id: thirdbodyrow
                width: parent.width-40;
                height: 2*parent.height/7
//                            color: "black"
                anchors.top: secondbodyrow.bottom
                anchors.horizontalCenter: secondbodyrow.horizontalCenter
//                            anchors.top: firstbodyrow.bottom
//                            anchors.
//                            anchors.verticalCenterOffset: firstbodyrow.height
//                            anchors.horizontalCenterOffset: 20

                Item{
                width: parent.width/2
                height: parent.height/3
                id: item10
                    Label{
                        text:  "<b>Обработка персональных данных</b>"
                        font.family: "Arial"
                        font.pointSize: 14
                        color: "#656565"
                    }

                  anchors.verticalCenter: parent.top
                  anchors.horizontalCenter: parent.left
                  anchors.verticalCenterOffset: 60
                  anchors.horizontalCenterOffset: this.width/2

                }



                Item{
                    id: item11
                    width: parent.width/2


                    DelayButton {
                        id: control
                        width: thirdbodyrow.height/2
                        height: thirdbodyrow.height/2
                        anchors.centerIn: parent
                        anchors.horizontalCenterOffset: -parent.width/6
                        anchors.verticalCenterOffset: thirdbodyrow.height/3


                        text: qsTr("Согласен")

                        style: DelayButtonStyle {

                            label: Text {
                                text: control.text
                                color: "white"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }

                            foreground: Rectangle {
//                                                implicitWidth: 50
//                                                implicitHeight: 50
                                color: "#5181b8"
//                                radius: size / 2

                                readonly property real size: Math.min(control.width, control.height)
//                                width: size
//                                height: size
                                radius:thirdbodyrow.height/4
                                width: thirdbodyrow.height/2
                                height: thirdbodyrow.height/2

                                anchors.centerIn: parent

                                Canvas {
                                    id: canvas
                                    anchors.fill: parent


                                    Connections {
                                        target: control
                                        onProgressChanged: canvas.requestPaint()
                                    }

                                    onPaint: {
                                        var ctx = getContext("2d")
                                        ctx.clearRect(0, 0, width, height)
                                        ctx.strokeStyle = "#f0f2f5"
                                        ctx.lineWidth = parent.size / 20
                                        ctx.beginPath()
                                        var startAngle = Math.PI / 5 * 3
                                        var endAngle = startAngle + control.progress * Math.PI / 5 * 9
                                        ctx.arc(width / 2, height / 2, width / 2 - ctx.lineWidth / 2 - 2, startAngle, endAngle)
                                        ctx.stroke()
                                    }
                                }
                            }
                        }
                    }








                    anchors.verticalCenter: item10.top
                    anchors.horizontalCenter: item10.right
                    anchors.horizontalCenterOffset: 3*this.width/4
                    anchors.verticalCenterOffset: 10
                }



                Rectangle {
                    height: 1
                    color: "#e7e8ec"
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right

                }


            }




            Rectangle{
                id: fuorthbodyrow
                width: parent.width-40;
                height: 2*parent.height/7
//                            color: "black"
                anchors.top: thirdbodyrow.bottom
                anchors.horizontalCenter: thirdbodyrow.horizontalCenter
//                            anchors.top: firstbodyrow.bottom
//                            anchors.
//                            anchors.verticalCenterOffset: firstbodyrow.height
//                            anchors.horizontalCenterOffset: 20

                Item{
                width: parent.width/2
                height: parent.height/3
                id: item12
                    Label{
                        text:  "<b>Громкость уведомлений</b>"
                        font.family: "Arial"
                        font.pointSize: 14
                        color: "#656565"
                    }

                  anchors.verticalCenter: parent.top
                  anchors.horizontalCenter: parent.left
                  anchors.verticalCenterOffset: 60
                  anchors.horizontalCenterOffset: this.width/2

                }



                Item{
                    id: item13
                    width: parent.width/2


                    Dial {
                        id: control1
                        anchors.centerIn: parent
                        anchors.horizontalCenterOffset: -parent.width/6
                        anchors.verticalCenterOffset: fuorthbodyrow.height/3
                        readonly property real size: Math.min(control.width, control.height)
                        width: size
                        height: size
                        value: slider.value
                        style: DialStyle {

                        background: Rectangle{
                            x: control.width / 2 - width / 2
                                    y: control.height / 2 - height / 2
                                    width: Math.max(64, Math.min(control.width, control.height))
                                    height: width
                                    color: "#5181b8"
                                    radius: width / 2
                                    border.color: control1.pressed ? "#afb7c2" : "#ffffff"
                                    border.width: 3
                                    opacity: control.enabled ? 1 : 0.3
                        }

                        handle: Rectangle {
                            id: handleItem1
                            x: control1.background.x + control1.background.width / 2 - width / 2
                            y: control1.background.y + control1.background.height / 2 - height / 2
                            width: 16
                            height: 16
                            color: control1.pressed ? "#afb7c2" : "#ffffff"
                            radius: 8
                            antialiasing: true
                            opacity: control1.enabled ? 1 : 0.3
                            transform: [
                                Translate {
                                    y: -Math.min(control1.background.width, control1.background.height) * 0.4 + handleItem1.height / 2
                                },
                                Rotation {
                                    angle: control1.angle
                                    origin.x: handleItem1.width / 2
                                    origin.y: handleItem1.height / 2
                                }
                            ]
                        }
                        }
                    }

//                            Dial {
//                                id: control1
////                                to: 100
//                                anchors.leftMargin: 10
//                                anchors.topMargin: 50
//                                anchors.top: slider.bottom
//                                anchors.horizontalCenter: parent.horizontalCenter
//                                anchors.centerIn: parent
//                                value: slider.value
//                                Material.accent: "#f9cf47"
//                            }

                            Slider {
                                id:slider
                                value: control1.value
//                                from: 1
//                                to: 100
                                anchors.top: control1.bottom
                                anchors.horizontalCenter: control1.horizontalCenter
                                anchors.bottomMargin: 10
                                anchors.left: parent.left
                                Material.accent: "#5181b8"

                            }




                    anchors.verticalCenter: item12.top
                    anchors.horizontalCenter: item12.right
                    anchors.horizontalCenterOffset: 3*this.width/4
                    anchors.verticalCenterOffset: 10
                }



                Rectangle {
                    height: 1
                    color: "#e7e8ec"
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right

                }


            }


            Rectangle{
                id: fifthbodyrow
                width: parent.width-40;
                height: parent.height/7
                anchors.top: fuorthbodyrow.bottom
                anchors.horizontalCenter: fuorthbodyrow.horizontalCenter


                Button {
                    id: savebutton
                    text: qsTr("<b>Сохранить</b>")
                    width: parent.width/3

                    contentItem: Text {
                        text: savebutton.text
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
                        color: savebutton.down ? "#6792c0" : "#5181b8"
                        border.color: "#5181b8"
                        border.width: 1
                        radius: 3
                    }
                     anchors.centerIn: parent
                }


            }

        }
    }
}
