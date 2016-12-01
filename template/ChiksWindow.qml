import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3

import "qrc:/js/System.js" as System

/*
  Всплывающее окно
  Важно!! кнопки не совсем одинаковые получатся, нужно исправить!
  */

Item {
    property string bckgColor: "#000000"
    property string mainColor: "#ffffff"
    property string titleText: qsTr("Заголовок")
    property string messageText: qsTr("Сообщение")
    // true - две кнопки(Да и Нет) , flase - одна (ОК)
    property bool twoButtons: false

    width: rootWindow.width
    height: rootWindow.height


    id: root
    z: 1
    visible: false

    //Фон позади всплывающего окна
    Rectangle {
        id: background
        width: parent.width
        height: parent.height
        color: bckgColor
        opacity: 0.8

        signal click();

        //Закрытие окна
        MouseArea {
            id: area
            anchors.fill: background
            onClicked: {
                root.visible = false
            }
        }
    }

    Rectangle {

        signal click();

        MouseArea {
            id: area2
            anchors.fill: mainWindow
            onClicked: {
                root.opacity = 1
            }
        }

        id: mainWindow
        anchors.horizontalCenter: parent.horizontalCenter
        width: background.width - background.width / 5
        height: background.height - background.height / 3
        anchors.verticalCenter: parent.verticalCenter
        color: mainColor
        radius: height / 30
        opacity: 1

        Text {
            id: title
            font.pixelSize: (titleText != "") ?  System.getPointSize(18) :  System.getPointSize(14)
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.right: parent.right
            anchors.rightMargin: 40
            anchors.left: parent.left
            anchors.leftMargin: 40
            font.family: mainFont.name
            text: (titleText != "") ? titleText : messageText
            visible: true
            clip: true
            textFormat: Text.PlainText
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            color: "#0038a5"
        }

        Text {
            id: message
            font.pointSize: System.getPointSize(14)
            anchors.top: title.bottom
            anchors.topMargin: 20

//            anchors.bottom: yes.top
//            anchors.bottomMargin: 30

            anchors.right: parent.right
            anchors.rightMargin: 20

            anchors.left: parent.left
            anchors.leftMargin: 20
            font.family: mainFont.name
            visible: true
            clip: true
            textFormat: Text.PlainText
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            color: "#0038a5"
            text: (titleText != "") ? messageText : ""
        }

        Row{
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            anchors.left: parent.left
            anchors.leftMargin: twoButtons ? 30 : 70
            anchors.right: parent.right
            anchors.rightMargin: twoButtons ? 30 : 70
            spacing: 40

            ChiksButton {
                id: yes

                text: qsTr("Да")

                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0

//                anchors.left: parent.left
//                anchors.leftMargin: 0

                width: rootWindow.width / 4
                visible: twoButtons
            }

            ChiksButton {
                id: no
                text: twoButtons ? qsTr("Нет") : qsTr("OK")
                width: twoButtons ? rootWindow.width / 4 : rootWindow.width / 3
//                anchors.right: parent.right
//                anchors.rightMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
//                anchors.left: twoButtons ? parent.right: parent.left
//                anchors.leftMargin: twoButtons ? (width + 30) : 0
                textColor: twoButtons ? "#0038a5" : "#ffffff"
                border: true
                color: twoButtons ? "#ffffff" : "#0038a5"
                onClick:{
                    root.visible = false
                }
            }
        }
    }
}