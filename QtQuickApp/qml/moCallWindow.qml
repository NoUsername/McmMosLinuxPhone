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
   /* Button {
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
        }
        id: "callBtn"
    }*/

    // Button 1
    /*Button {
        //button position
        //Warning! Changing values here will overwrite button properities
        x: parent.width/100*2
        y: parent.height - 80
        iconPicSource: "call.png"
        onClicked: {
            console.log("Play 32bit button was clicked!");
            console.log("Reseted Counter!");
            JS.ResetCounter();
            outField.text = JS.GetCount();
        }
        id: "button1"
    }

    // Button 2
    Button {
        //button position
        //Warning! Changing values here will overwrite button properities
        x: parent.width - 160
        y: parent.height - 80
        iconPicSource: "decline.png"
        onClicked: {
            console.log("Play 64bit button was clicked!");
            JS.Increase();
            outField.text = JS.GetCount();
            console.log("Increased counter to:"+JS.GetCount());
        }
        id: "button2"
    }*/

    /*Text {
        x: parent.width/2
        y: parent.height/2
        text: "Counter"
        id: "outField"
        color: "white"
    }*/
}

/*Rectangle {
    width: 500
    height: 500
    id: window
    state: "State1"

    Image {
        id: image
        width: parent.width; height: parent.height
        source: "bg.png"
        clip: true      // only makes a difference if mode is PreserveAspectCrop
        smooth: true
        opacity: 0.5
    }

    Text {
        id: title
        x: window.width/2 - width/2
        y: 20
        text: "QML"
        font.pointSize: 24
        font.bold: true
    }

    Text {
        x: window.width/2 - width/2
        y: 100
        text: "labelField"
        id: outputField
    }

    Rectangle {
        color: "white"
        width: 80
        height: 20
        x: window.width/2 - width/2
        y: 120
        TextInput {
            id: inputField
            text: "inputField"
        }
    }

    Button {
        x: 20
        y: 300
        width: 300
        text: "Button 1 (logger)"
        onClicked: {
            var d = new Date();
            console.log("button clicked @ " + d.toTimeString());
        }
    }

    Button {
        id: btn2
        x: parent.width - 20 - btn2.width
        y: 300
        text: "Button 2 (increaser)"
        onClicked: {

        }
    }

    Button {
        id: btn3
        text: "click me :)"
        x: parent.width/2 - width/2
        y: 350
        onClicked:  {
            if (window.state == "State1")
                window.state = "State2";
            else if (window.state == "State2")
                window.state = "State3";
            else
                window.state = "State1";
        }
    }

    states: [
        State {
            name: "State1"
            PropertyChanges {target: title; x: window.width/2 - width/2 }
        },
        State {
            name: "State2"
            PropertyChanges {target: title; x: 50 }
        },
        State {
            name: "State3"
            PropertyChanges {target: title; x: 350 }
        }
    ]


    transitions: [
        Transition {
            from: "*"; to: "State2"
            NumberAnimation { properties: "x,y"; easing.type: Easing.InBack; duration: 800 }
        },
        Transition {
            from: "*"; to: "State1"
            NumberAnimation { properties: "x,y"; easing.type: Easing.OutBounce; duration: 800 }
        }
        ,
         Transition {
          from: "*"; to: "State3"
          NumberAnimation { properties: "x,y"; easing.type: Easing.OutElastic; duration: 1500 }
        }
    ]

}*/


