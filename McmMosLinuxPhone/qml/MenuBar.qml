import Qt 4.7

Rectangle {
    id: menuBarID
    width: parent.width; height: 30
    color: "#282828"

    Item {
        id: mainMenuBarID

        width: menuBarID.width; height: menuBarID.height; anchors.centerIn: menuBarID

        Grid {
            // Power on ofono and go to homescreen
            id: grid; rows: 1; columns: 4; spacing: 6
            Button { width: 50; height: mainMenuBarID.height-1; id: onBtn; text: "On";  textColor: "green";  onClicked:
                    {
                        callingWindowID.state = 'callingWindowStateOut'
                        calcWindowID.state = 'calcWindowStateOut'
                        callWindowID.state = 'callWindowStateOut'
                        mainWindowID.state = 'mainWindowStateIn'
                        OfonoContext.setPowerOn();
                    }
            }
            // Power off ofono and go to homescreen
            Button { width: 50; height: mainMenuBarID.height-1; id: offBtn; text: "Off";  textColor: "green"; onClicked:
                    {
                        callingWindowID.state = 'callingWindowStateOut'
                        calcWindowID.state = 'calcWindowStateOut'
                        callWindowID.state = 'callWindowStateOut'
                        mainWindowID.state = 'mainWindowStateIn'
                        OfonoContext.setPowerOff();
                    }
            }
            // Go to homescreen
            Button { width: 50; height: mainMenuBarID.height-1; id: homeBtn; text: "Home";  textColor: "green";  onClicked:
                    {
                        callingWindowID.state = 'callingWindowStateOut'
                        calcWindowID.state = 'calcWindowStateOut'
                        callWindowID.state = 'callWindowStateOut'
                        mainWindowID.state = 'mainWindowStateIn'
                    }
            }
        }
    }
}
