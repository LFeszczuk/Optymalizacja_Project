import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: customBtn

    property color colorDefault:"#555555"
    property color colorMouseOver: "#555555"
    property color colorPressed:"#555555"

    QtObject{
        id:internal
        property var dynamicColor: if(customBtn.down){
                                       customBtn.down ? colorPressed : colorDefault
                                   } else {
                                       customBtn.hovered ? colorMouseOver : colorDefault
                                   }

    }
    width: 200
    height: 40
    text:qsTr("custom button")
    background: Rectangle{
        color: internal.dynamicColor
        radius:10
    }
}
