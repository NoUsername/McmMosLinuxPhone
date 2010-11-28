
import Qt 4.7
import "call.js" as CallEngine

Rectangle {
    id: callWindowID

    width: parent.width; height: parent.height+20 // +20 to avoid clash with menubar
    color: "#287728"

    property string leftArrow: "\u2190"

    function doOp(operation) { CallEngine.doOperation(operation) }

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
        id: main

        width: parent.width; height: parent.height; anchors.centerIn: parent

        Column {
            id: box; spacing: 8

            anchors { fill: parent; topMargin: 6; bottomMargin: 6; leftMargin: 6; rightMargin: 6 }

            Display {
                id: display
                width: box.width-3
                height: 64
            }

            Column {
                id: column; spacing: 6

                property real h: ((box.height - 72) / 6) - ((spacing * (6 - 1)) / 6)
                property real w: (box.width / 4) - ((spacing * (4 - 1)) / 4)

                Grid {
                    id: grid; rows: 5; columns: 3; spacing: 6

                    property real w: (box.width / columns) - ((spacing * (columns - 1)) / columns)

                    BlankButton { width: grid.w; height: column.h; operation: "1"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: "2"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: "3"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: "4"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: "5"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: "6"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: "7"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: "8"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: "9"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: "*"; color: 'red' }
                    BlankButton { width: grid.w; height: column.h; operation: "0"; color: 'blue' }
                    BlankButton { width: grid.w; height: column.h; operation: "#"; color: 'red' }

                    BlankButton { width: grid.w; height: column.h; operation: '+'; source: "Pics/gpl/Gnome-call-start_48.png"; color: 'transparent'}
                    BlankButton { width: grid.w; height: column.h; operation: leftArrow; color: 'red'}
                }
            }
        }
    }
    states: [
        State {
            name: "callWindowStateOut"
            PropertyChanges { target: callWindowID; x: -1000; y: 30 } // 30 to provide space for manu bar -1000 to go out of screen
        },

        State {
            name: "callWindowStateIn"
            PropertyChanges { target: callWindowID; x: 0; y: 30  } // 30 to provide space for manu bar
        }
    ]
}
