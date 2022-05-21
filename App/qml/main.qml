import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import Qt.labs.platform 1.1
import "controls"

Window {
    id: mainWindow
    width: 1000
    height: 580
    visible: true
    color: "#00000000"
    title: qsTr("Hello World")

    flags: Qt.Window | Qt.FramelessWindowHint

    QtObject{
        id: internal


    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: shortcuts.home
        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrls)
            Qt.quit()
        }
        onRejected: {
            console.log("Canceled")
            Qt.quit()
        }
        Component.onCompleted: visible = false
    }
    Rectangle {
        id: backGround
        color: "#00242b"
        border.color: "#022e3e"
        border.width: 2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10

        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.fill: parent
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topBar
                height: 60
                color: "#1c1d20"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                ToggleButton {
                    btnColorDefault: "#555555"
                    btnIconSource: "../menu_icon.svg"

                    //                    btnColorDefault: "#012d31"
                    //                    btnColorMouseOver: "#23272e"
                    //                    id: togglebutton
                    //                    width: 70
                    //                    height: 60
                    //                    text: qsTr("Toggle")
                    //                    anchors.left: parent.left
                    //                    anchors.top: parent.top
                    //                    anchors.topMargin: 0
                    //                    anchors.leftMargin: 0


                }
                Rectangle {
                    id: topbardescription
                    y: 18
                    height: 25
                    color: "#23272e"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 70
                    anchors.bottomMargin: 0

                    Label {
                        id: topright
                        color: "#e3f9fd"
                        text: qsTr("Right text")
                        anchors.left: topbarlabel.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        anchors.rightMargin: 10
                        font.pointSize: 10
                    }

                    Label {
                        id: topbarlabel
                        x: -60
                        y: -35
                        color: "#e3f9fd"
                        text: qsTr("Planer systemu kolejkowania zadań")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 10
                        anchors.rightMargin: 300
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                    }
                }

                Rectangle {
                    id: title
                    height: 35
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 105
                    anchors.leftMargin: 70
                    anchors.topMargin: 0
                    DragHandler{
                        onActiveChanged: if(active){
                                             mainWindow.startSystemMove()
                                         }
                    }

                    Image {
                        id: icon
                        width: 28
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "qrc:/qtquickplugin/images/template_image.png"
                        anchors.topMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 5
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: label
                        color: "#e3f9fd"
                        text: qsTr("Planer zadań")
                        anchors.left: icon.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 10
                        anchors.leftMargin: 5
                    }

                }

                Row {
                    id: row
                    anchors.left: title.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: topbardescription.top
                    anchors.rightMargin: 0
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0

                    //                    TopBarButton {
                    //                        id: button
                    //                        btnIconSource: "../images/svg_images/minimize_icon.svg"

                    //                    }

                    //                    TopBarButton {
                    //                        id: button1
                    //                        btnIconSource: "../images/svg_images/maximize_icon.svg"
                    //                    }

                    //                    TopBarButton {
                    //                        id: button2
                    //                        visible: true
                    //                        btnIconSource: "../images/svg_images/close_icon.svg"
                    //                    }

                    TopBarButton {
                        id: minimize
                        anchors.bottom: parent.bottom
                        btnIconSource: "../minimize_icon.svg"
                        btnColorDefault: "#555555"
                        anchors.bottomMargin: 0
                        onClicked: mainWindow.showMinimized()
                    }

                    TopBarButton {
                        id: maximize
                        anchors.bottom: parent.bottom
                        btnColorDefault: "#555555"
                        btnIconSource: "../maximize_icon.svg"
                        anchors.bottomMargin: 0
                        onClicked: mainWindow.showMaximized()
                    }

                    TopBarButton {
                        id: close
                        anchors.bottom: parent.bottom
                        btnColorDefault: "#555555"
                        btnIconSource: "../close_icon.svg"
                        anchors.bottomMargin: 0
                        onClicked: mainWindow.close()
                    }

                }
            }

            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 0

                Rectangle {
                    id: leftmenu
                    width: 70
                    color: "#23272e"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0

                    Column {
                        id: column
                        width: 70
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 90
                        anchors.topMargin: 0

                        OpenButton {
                            id: open
                            //                            text: qsTr("Open")
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            btnColorDefault: "#555555"
                            btnIconSource: "../open_icon.svg"
                            btnColorMouseOver: "#bc0c8c"
                            anchors.topMargin: 0
                            anchors.leftMargin: 0
                            anchors.rightMargin: 0
                            clip: true
                            onClicked: fileDialog.open()

                        }

                    }
                }

                Rectangle {
                    id: contentpages
                    color: "#1c1d20"
                    anchors.left: leftmenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 25
                    anchors.topMargin: 0
                }

                Rectangle {
                    id: rectangle
                    color: "#23272e"
                    anchors.left: leftmenu.right
                    anchors.right: parent.right
                    anchors.top: contentpages.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    Label {
                        id: topbarlabel1
                        color: "#e3f9fd"
                        text: qsTr("Wykonali: Leonard Feszczuk | Denis Firat | Maciej Marczyszyn")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        styleColor: "#23272e"
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        anchors.rightMargin: 30
                        font.pointSize: 10
                    }
                }
            }
        }
    }
    Connections{
        target:backend
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
