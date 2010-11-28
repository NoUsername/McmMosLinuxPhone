
import Qt 4.7
import "calling.js" as CallingEngine


Rectangle {
    id: callingWindowID

    function setNumber(_number) { CallingEngine.setNumber(_number) }

    width: parent.width; height: parent.height+20 // +20 to avoid clash with menubar
    color: "#287728"

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

    Item {
        id: callingWindowMainID

        width: parent.width; height: parent.height; anchors.centerIn: parent

        Column {
            id: box; spacing: 8

            anchors { fill: parent; topMargin: 6; bottomMargin: 6; leftMargin: 6; rightMargin: 6 }

            Display {
                id: callingDisplay
                width: box.width-3
                height: 64
            }

            Button { width: 50; height: 50; iconPicSource: "Pics/gpl/Gnome-call-stop_48.png"; color: 'transparent'; x: callingWindowMainID.width/2-25;  onClicked:
                {
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
            name: "callingWindowStateOut"
            PropertyChanges { target: callingWindowID; x: -1000; y: 30 } // 30 to provide space for manu bar -1000 to go out of screen
        },

        State {
            name: "callingWindowStateIn"
            PropertyChanges { target: callingWindowID; x: 0; y: 30  } // 30 to provide space for manu bar
        }
    ]
}
