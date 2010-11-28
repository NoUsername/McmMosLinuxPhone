import Qt 4.7

Rectangle {
    id: menuBarID

    width: parent.width; height: 20
    color: "#282828"



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

                Row {
                    spacing: 6
                    BlankButton { width: column.w; height: column.h; color: 'blue'; operation: "Off" }
                    BlankButton { width: column.w; height: column.h; color: 'blue'; operation: leftArrow }
                    BlankButton { width: column.w; height: column.h; color: 'blue'; operation: "C" }
                    BlankButton { width: column.w; height: column.h; color: 'blue'; operation: "AC" }
                }

                Row {
                    spacing: 6
                    property real w: (box.width / 4) - ((spacing * (4 - 1)) / 4)

                    BlankButton { width: column.w; height: column.h; color: 'blue'; operation: "mc" }
                    BlankButton { width: column.w; height: column.h; color: 'blue'; operation: "m+" }
                    BlankButton { width: column.w; height: column.h; color: 'blue'; operation: "m-" }
                    BlankButton { width: column.w; height: column.h; color: 'blue'; operation: "mr" }
                }

                Grid {
                    id: grid; rows: 5; columns: 5; spacing: 6

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

    }

    states: [
        State {
            name: "calcWindowStateOut"
            PropertyChanges { target: calcWindowID; x: -1000; y: 0 }
        },

        State {
            name: "calcWindowStateIn"
            PropertyChanges { target: calcWindowID; x: 0; y: 0  }
        }
    ]
}
