import Qt 4.7

import "js.js" as JS
import "calling.js" as CallingEngine

Rectangle {
    width: 240
    height: 320
    color: "black"
    id: mainWindowID


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
        y: 35 //parent.height/100*5 // space for menubar
        color: "white"
        text: "McmMosLinuxPhone"
        id: label
    }

    MenuBar {
        id: menuBar
    }

    MenuWindow {
        id: mainWindowGrid
    }

    CalcWindow {
        id: calcWindowID
        state: 'calcWindowStateOut'
    }

    CallWindow {
        id: callWindowID
        state: 'callWindowStateOut'
    }

    CallingWindow {
        id: callingWindowID
        state: 'callingWindowStateOut'
    }

    Connections {
         target: OfonoContext
         onIncomingCall: {
             console.log("QML: Incoming Call: " + id);
             callingWindowID.state = 'callingWindowStateIn'
             callingWindowID.setNumber(id);
             calcWindowID.state = 'calcWindowStateOut'
             callWindowID.state = 'callWindowStateOut'
             mainWindowID.state = 'mainWindowStateOut'
         }
         onOutgoingCall: {
             console.log("QML: Outgoing Call: " + id);
             callingWindowID.state = 'callingWindowStateIn'
             callingWindowID.setNumber(id);
             calcWindowID.state = 'calcWindowStateOut'
             callWindowID.state = 'callWindowStateOut'
             mainWindowID.state = 'mainWindowStateOut'
         }
     }

    states: [
        State {
            name: "mainWindowStateOut"
            PropertyChanges { target: mainWindowGrid; x: -1000; y: label.y + label.height; } // main window grid is below label
        } ,
        State {
            name: "mainWindowStateIn"
            PropertyChanges { target: mainWindowGrid; x: mainWindowID.width / 2 - mainWindowGrid.width/2; y: label.y + label.height;  } // main window grid is below label
        }
    ]

}
