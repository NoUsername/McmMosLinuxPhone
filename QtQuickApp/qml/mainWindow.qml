import Qt 4.7

import "js.js" as JS

Rectangle {
    width: 240
    height: 320
    color: "black"

    // Background info
    Image {
        source: "bg.png"
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
        id: "label"
    }

    // HomeBtn
    Button {
        //button position
        //Warning! Changing values here will overwrite button properities
        x: parent.width/100*2
        y: parent.height - 80
        iconPicSource: "home.png"
        onClicked: {
            console.log("Make homescreen available!");
            JS.GotoHome();
            console.log("Callscreen called:"+JS.GetHomeCnt());
            OfonoContext.setPowerOn();
        }
        id: "homeBtn"
    }

    // CallBtn
    Button {
        //button position
        //Warning! Changing values here will overwrite button properities
        x: parent.width - 160
        y: parent.height - 80
        iconPicSource: "call.png"
        onClicked: {
            console.log("Make callscreen available!");
            JS.GotoMOCall();
            console.log("Callscreen called:"+JS.GetMOCallCnt());
            OfonoContext.setPowerOff();
        }
        id: "callBtn"
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
