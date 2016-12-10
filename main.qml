import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2
import "./pages"
import "./template"

import xyz.prinkov 1.0

ApplicationWindow {
    visible: true
    property bool debug : true
    id: rootWindow
    width: debug ? 320 : Screen.width
    height: debug ? 640 : Screen.height

    title: qsTr("Chicks-chicks")

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: IndexLogin{}

        }
    Component.onCompleted: {
        User.nickname = ""
    }

    function createError(title, message) {
        var objStr = "import './template'; ChiksWindow{id: msgErr; visible: true; titleText:'"
                + title + "'; messageText: '" + message + "'; }"
        var msgErr = Qt.createQmlObject(objStr, rootWindow, "msgErr");
        msgErr.visibleChanged.connect(function(){
            msgErr.destroy()
        })
        return msgErr
    }

    function loading() {
        var load = Qt.createQmlObject("import './pages'; Loading{}", rootWindow, "load")
        load.start()
        load.visibleChanged.connect(function(){
            load.destroy()
        })
        return load
    }

    function chiksLoading(text) {
        var fileLoad = Qt.createQmlObject("import './template'; ChiksLoader{text:'" + text + "'}", rootWindow, "fileLoad")
        fileLoad.visibleChanged.connect(function() {
            fileLoad.destroy()
        })
        return fileLoad
    }

}
