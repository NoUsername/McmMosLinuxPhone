import Qt 4.7

import "js.js" as JS

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
        y: parent.height/100*5
        color: "white"
        text: "McmMosLinuxPhone"
        id: label
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



    states: [
        State {
            name: "mainWindowStateOut"
            PropertyChanges { target: mainWindowGrid; x: -1010; y: 0 }
        },

        State {
            name: "mainWindowStateIn"
            PropertyChanges { target: mainWindowID; x: parent.width / 2 - width/2; y: 0  }
        }
    ]

}
