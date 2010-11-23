import Qt 4.7

Item {
    id: container
    width: buttonImage.width
    property string text: ""
    property string iconSource: "btn.png"
    signal clicked
    Image {
        id: buttonImage
        opacity: 1
        source: iconSource
        width: theText.width + 20; height: container.cellHeight
        fillMode: "Stretch"

    }
    Text{
        id: theText
        anchors.centerIn:  buttonImage
        text: container.text
        color: "black"
    }

    MouseArea {
        id: mouseRegion
        anchors.fill:  buttonImage
        onClicked: { container.clicked(); }
    }

    states: [
        State {
            name: "Pressed"; when: mouseRegion.pressed;

            PropertyChanges {target: theText; opacity: 0.6 }
        }
    ]

}
