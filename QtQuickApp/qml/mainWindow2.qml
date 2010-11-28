import Qt 4.7

import "js.js" as JS

Rectangle {
    width: 240
    height: 320
    color: "black"

    // Background info
    Image {
        source: "Pics/bg.jpg"
        id: image
        // image should move and scale with the borders
        width: parent.width; height: parent.height
        // for smoother positioning
        smooth: true
        opacity: 0.9
    }

    // Label
    Text {
        x: parent.width/2-65
        y: parent.height/100*5
        color: "white"
        text: "McmMosLinuxPhone"
        id: label
    }

    Grid {
        columns: 3
        spacing: 2
        x: parent.width / 2 - width/2
        // grid is under the label
        y: label.y + label.height

        // HomeBtn
        Button {id: homeBtn; iconPicSource: "Pics/gpl/iPod.png"; onClicked: { JS.GotoHome(); } }
        // CallBtn
        Button {id: callBtn; iconPicSource: "Pics/gpl/Phone.png"; onClicked: { JS.GotoMOCall(); } }
        Button {id: calculatorBtn; iconPicSource: "Pics/gpl/Calculator.png"; onClicked: { JS.GotoCalculator(); } }
        Button {id: testBtn; iconPicSource: "Pics/gpl/Clock.png"; onClicked: { JS.GotoMOCall(); } }
        Button {id: testBtn2; iconPicSource: "Pics/gpl/Chat.png"; onClicked: { JS.GotoMOCall(); } }
        Button {id: testBtn3; iconPicSource: "Pics/gpl/Calendar.png"; onClicked: { JS.GotoMOCall(); } }
        Button {id: testBtn4; iconPicSource: "Pics/gpl/Notes.png"; onClicked: { JS.GotoMOCall(); } }



    }

    Connections {
        target: OfonoContext
        onIncomingCall: {
            console.log("QML: Incoming Call: " + id);
        }
        onOutgoingCall: {
            console.log("QML: Outgoing Call: " + id);
        }
    }

}
