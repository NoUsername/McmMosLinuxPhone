# Add more folders to ship with the application, here

folder_01.source = ./qml
folder_01.target = .
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH = ./qml/qml

# Avoid auto screen rotation
#DEFINES += ORIENTATIONLOCK

# Needs to be defined for Symbian
#DEFINES += NETWORKACCESS

symbian:TARGET.UID3 = 0xE32F1904

# Define QMLJSDEBUGGER to allow debugging of QML in debug builds
# (This might significantly increase build time)
# DEFINES += QMLJSDEBUGGER

# If your application uses the Qt Mobility libraries, uncomment
# the following lines and add the respective components to the 
# MOBILITY variable. 
# CONFIG += mobility
# MOBILITY +=

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    Ofonov.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    qml/Button.qml \
    qml/js.js \
    qml/BlankButton.qml \
    qml/Display.qml \
    qml/calculator.js \
    qml/call.js \
    qml/MainWindow.qml \
    qml/CallWindow.qml \
    qml/MainWindow.qml \
    qml/CalcWindow.qml \
    qml/MenuWindow.qml \
    qml/MenuBar.qml

HEADERS += \
    Ofonov.h
