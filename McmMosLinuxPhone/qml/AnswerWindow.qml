import Qt 4.7

import "answer.js" as AnswerEngine


Rectangle {
    id: answerWindowID

    function setNumber(_number) { AnswerEngine.setNumber(_number) }

    width: parent.width; height: parent.height+20 // +20 to avoid clash with menubar
    color: "#287728"

    // Background info
    Image {
        source: "Pics/bg.png"
        id: image
        // image should move and scale with the borders
        width: parent.width; height: parent.height
        // for smoother positioning
        smooth: true
        opacity: 0.9
    }

    Item {
        id: answerWindowMainID

        width: parent.width; height: parent.height; anchors.centerIn: parent

        Column {
            id: box; spacing: 8

            anchors { fill: parent; topMargin: 1; bottomMargin: 1; leftMargin: 1; rightMargin: 1 }

            Display {
                id: answerDisplay
                width: box.width-3
                height: 64
            }

            Button { width: 50; height: 50; iconPicSource: "Pics/gpl/Gnome-call-start_48.png"; color: 'transparent'; x: answerWindowMainID.height/2; y: answerWindowMainID.width/2-50;onClicked:
                {
                    OfonoContext.answerCall();
                    answerWindowID.state = 'answerWindowStateOut'
                    callingWindowID.state = 'callingWindowStateIn'
                    calcWindowID.state = 'calcWindowStateOut'
                    callWindowID.state = 'callWindowStateOut'
                    mainWindowID.state = 'mainWindowStateOut'
                }
            }

            Button { width: 50; height: 50; iconPicSource: "Pics/gpl/Gnome-call-stop_48.png"; color: 'transparent'; x: answerWindowMainID.height/2; y: answerWindowMainID.width/2+50;  onClicked:
                {
                    OfonoContext.stopPhoneCall();
                    answerWindowID.state = 'answerWindowStateOut'
                    callingWindowID.state = 'callingWindowStateOut'
                    calcWindowID.state = 'calcWindowStateOut'
                    callWindowID.state = 'callWindowStateOut'
                    mainWindowID.state = 'mainWindowStateIn'
                }
            }
        }
    }
    states: [
        State {
            name: "answerWindowStateOut"
            PropertyChanges { target: answerWindowID; x: -1000; y: 30 } // 30 to provide space for manu bar -1000 to go out of screen
        },

        State {
            name: "answerWindowStateIn"
            PropertyChanges { target: answerWindowID; x: 0; y: 30  } // 30 to provide space for manu bar
        }
    ]
}
