import Qt 4.7
import "calculator.js" as CalcEngine

Rectangle {
    id: calcWindowID

    width: parent.width; height: parent.height // +30 to avoid clash with menubar
    color: "#282828"

    property string rotateLeft: "\u2939"
    property string rotateRight: "\u2935"
    property string leftArrow: "\u2190"
    property string division : "\u00f7"
    property string multiplication : "\u00d7"
    property string squareRoot : "\u221a"
    property string plusminus : "\u00b1"

    function doOp(operation) { CalcEngine.doOperation(operation) }

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
        id: main

        width: parent.width; height: parent.height-30;

        Column {
            id: box; spacing: 2

            anchors { fill: parent; topMargin: 1; bottomMargin: 1; leftMargin: 6; rightMargin: 6 }

            Display {
                id: display
                width: box.width-3
                height: 64
            }

            Column {
                id: column; spacing: 1

                property real h: ((box.height - 72) / 6) - ((spacing * (6 - 1)) / 6)
                property real w: (box.width / 4) - ((spacing * (4 - 1)) / 4)

                Row {
                    spacing: 1
                    //BlankButton { width: column.w; height: column.h; color: 'blue'; operation: "Off" }
                    BlankButton { width: column.w; height: column.h; color: 'blue'; operation: leftArrow }
                    BlankButton { width: column.w; height: column.h; color: 'blue'; operation: "C" }
                    BlankButton { width: column.w; height: column.h; color: 'blue'; operation: "AC" }
                }

                Row {
                    spacing: 1
                    property real w: (box.width / 4) - ((spacing * (4 - 1)) / 4)

                    BlankButton { width: column.w; height: column.h; color: 'blue'; operation: "mc" }
                    BlankButton { width: column.w; height: column.h; color: 'blue'; operation: "m+" }
                    BlankButton { width: column.w; height: column.h; color: 'blue'; operation: "m-" }
                    BlankButton { width: column.w; height: column.h; color: 'blue'; operation: "mr" }
                }

                Grid {
                    id: grid; rows: 5; columns: 5; spacing: 1

                    property real w: (box.width / columns) - ((spacing * (columns - 1)) / columns)

                    BlankButton { width: grid.w; height: column.h; operation: "7"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: "8"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: "9"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: division }
                    BlankButton { width: grid.w; height: column.h; operation: squareRoot }
                    BlankButton { width: grid.w; height: column.h; operation: "4"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: "5"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: "6"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: multiplication }
                    BlankButton { width: grid.w; height: column.h; operation: "x^2" }
                    BlankButton { width: grid.w; height: column.h; operation: "1"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: "2"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: "3"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: "-" }
                    BlankButton { width: grid.w; height: column.h; operation: "1/x" }
                    BlankButton { width: grid.w; height: column.h; operation: "0"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: "." }
                    BlankButton { width: grid.w; height: column.h; operation: plusminus }
                    BlankButton { width: grid.w; height: column.h; operation: "+" }
                    BlankButton { width: grid.w; height: column.h; operation: "="; color: 'red' }
                }
            }
        }



        /*states: [
            State {
                name: "orientation " + Orientation.Landscape
                PropertyChanges { target: main; rotation: 90; width: window.height; height: window.width }
                PropertyChanges { target: rotateButton; operation: rotateLeft }
            },
            State {
                name: "orientation " + Orientation.PortraitInverted
                PropertyChanges { target: main; rotation: 180; }
                PropertyChanges { target: rotateButton; operation: rotateRight }
            },
            State {
                name: "orientation " + Orientation.LandscapeInverted
                PropertyChanges { target: main; rotation: 270; width: window.height; height: window.width }
                PropertyChanges { target: rotateButton; operation: rotateLeft }
            }
        ]

        transitions: Transition {
            SequentialAnimation {
                PropertyAction { target: rotateButton; property: "operation" }
                RotationAnimation { direction: RotationAnimation.Shortest; duration: 300; easing.type: Easing.InOutQuint  }
                NumberAnimation { properties: "x,y,width,height"; duration: 300; easing.type: Easing.InOutQuint }
            }
        }*/
    }

    states: [
        State {
            name: "calcWindowStateOut"
            PropertyChanges { target: calcWindowID; x: -1000; y: 30 }  // 30 to provide space for manu bar -1000 to go out of screen
        },

        State {
            name: "calcWindowStateIn"
            PropertyChanges { target: calcWindowID; x: 0; y: 30  } // 30 to provide space for manu bar
        }
    ]
}
