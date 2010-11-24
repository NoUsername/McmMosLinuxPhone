import Qt 4.7


Rectangle {
    id: buttonContainer
    property string text: ""    //no used because pictures has text
    property string iconPicSource: ""
    property string textColor: "black"
    signal clicked
    width: 50
    height: 50
    // background color
    color: "transparent"
    opacity: 1


    // Border image which is on top of the button
    BorderImage {
        id: buttonImage
        opacity: 1
        source: iconPicSource
        width: parent.width; height: parent.height
        smooth: true
    }

    // If anyone would like to create a text above the picture
    Text{
        anchors.centerIn:  buttonImage
        text: buttonContainer.text
        color: textColor
    }

    // Trigger area :)
    MouseArea {
        id: mouseRegion
        // region where cursor may react
        anchors.fill:  buttonImage
        onClicked: {
            // send to container that we can trigger the button (log message)
            buttonContainer.clicked();
        }
    }

    states: [
        State {
            name: "Pressed";
            when: mouseRegion.pressed;
            PropertyChanges {
                target: buttonContainer;
                opacity: 0.5
                width: 45
                height: 45
            }
        }
    ]

    transitions: Transition {
        NumberAnimation { properties:  "x,y"; easing.type: Easing.InOutQuad }
    }
}
