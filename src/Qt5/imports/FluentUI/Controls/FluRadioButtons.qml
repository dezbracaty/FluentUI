import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import FluentUI 1.0

ColumnLayout {
    default property alias buttons: control.data
    property int currentIndex : -1
    property bool disabled: false
    property bool manuallyDisabled: false
    id:control
    onCurrentIndexChanged: {
        for(var i = 0;i<buttons.length;i++){
            buttons[i].checked = false
        }
        var button = buttons[currentIndex]
        if(button){
            button.checked = true
        }
    }
    onDisabledChanged: {
        refreshButtonStatus()
    }
    onManuallyDisabledChanged: {
        refreshButtonStatus()
    }
    Component.onCompleted: {
        for(var i = 0;i<buttons.length;i++){
            buttons[i].clickListener = function(){
                for(var i = 0;i<buttons.length;i++){
                    var button = buttons[i]
                    if(this === button){
                        currentIndex = i
                    }
                }
            }
        }
        refreshButtonStatus()
    }

    function refreshButtonStatus() {
        for(var i = 0;i<buttons.length;i++){
            if(!manuallyDisabled) buttons[i].enabled = !disabled
        }
    }
}
