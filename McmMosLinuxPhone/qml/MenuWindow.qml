import Qt 4.7

Grid {
    columns: 3
    spacing: 2
    x: parent.width / 2 - width/2
    // grid is under the label
    y: label.y + label.height

    Button {id: homeBtn; iconPicSource: "Pics/gpl/iPod.png"; onClicked: {} }
    Button {id: callBtn; iconPicSource: "Pics/gpl/Phone.png"; onClicked:
        {
            callWindowID.state = 'callWindowStateIn'
            mainWindowID.state = 'mainWindowStateOut'
         }
    }
    Button {id: calculatorBtn; iconPicSource: "Pics/gpl/Calculator.png"; onClicked:
        {
            calcWindowID.state = 'calcWindowStateIn'
            mainWindowID.state = 'mainWindowStateOut'
        }
    }
    Button {id: testBtn; iconPicSource: "Pics/gpl/Clock.png"; onClicked: {} }
    Button {id: testBtn2; iconPicSource: "Pics/gpl/Chat.png"; onClicked: {} }
    Button {id: testBtn3; iconPicSource: "Pics/gpl/Calendar.png"; onClicked: {} }
    Button {id: testBtn4; iconPicSource: "Pics/gpl/Notes.png"; onClicked:{}
    }
}
