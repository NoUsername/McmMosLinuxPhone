import Qt 4.7

import "calling.js" as CallingEngine

Rectangle {
    width: 240
    height: 320
    color: "black"
    id: mainWindowID


    // Background
    Image {
        source: "Pics/bg.png"
        id: image
        // image should move and scale with the borders
        width: parent.width; height: parent.height
        // for smoother positioning
        smooth: true
        opacity: 0.9
    }

    // Label for headline name
    Text {
        x: parent.width/2-65
        y: 35 // space for menubar
        color: "white"
        text: "McmMosLinuxPhone"
        id: label
    }

	// top menu bar
    MenuBar {
        id: menuBar
    }

	// main window (home screen)
    MenuWindow {
        id: mainWindowGrid
    }

	// calculator window (calc app)
    CalcWindow {
        id: calcWindowID
        state: 'calcWindowStateOut'
    }

	// call window (call app - number field)
    CallWindow {
        id: callWindowID
        state: 'callWindowStateOut'
    }

	// actually call window (once mt call accepted or mo call in progress)
    CallingWindow {
        id: callingWindowID
        state: 'callingWindowStateOut'
    }

	// is displayed once an mt call was triggered
    AnswerWindow{
        id: answerWindowID
        state: 'answerWindowStateOut'
    }

	// Calls from qt-cpp ofono context
    Connections {
         target: OfonoContext
         onIncomingCall: {
             console.log("QML: Incoming Call: " + id);
             answerWindowID.state = 'answerWindowStateIn'
             answerWindowID.setNumber(id);
             callingWindowID.state = 'callingWindowStateOut'
             callingWindowID.setNumber(id);
             calcWindowID.state = 'calcWindowStateOut'
             callWindowID.state = 'callWindowStateOut'
             mainWindowID.state = 'mainWindowStateOut'
         }
         onOutgoingCall: {
             console.log("QML: Outgoing Call: " + id);
             callingWindowID.state = 'callingWindowStateIn'
             answerWindowID.state = 'answerWindowStateOut'
             callingWindowID.setNumber(id);
             calcWindowID.state = 'calcWindowStateOut'
             callWindowID.state = 'callWindowStateOut'
             mainWindowID.state = 'mainWindowStateOut'
         }

         onPhoneCallAborted: {
             callingWindowID.state = 'callingWindowStateOut'
             answerWindowID.state = 'answerWindowStateOut'
			 calcWindowID.state = 'calcWindowStateOut'
             callWindowID.state = 'callWindowStateOut'
             mainWindowID.state = 'mainWindowStateIn'
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
