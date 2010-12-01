#-------------------------------------------------
#
# Project created by QtCreator 2010-11-24T10:33:19
#
#-------------------------------------------------

QT       += core gui declarative

include(qmlapplicationviewer/qmlapplicationviewer.pri)

TARGET = McmMosLinuxPhone
TEMPLATE = app
unix {

    BINDIR = $$PREFIX/bin

    #MAKE INSTALL

    INSTALLS += target

    target.path = $$BINDIR

}


CONFIG += qdbus

SOURCES += main.cpp\
    dbus/OfonoVoiceCallManager.cpp \
    dbus/OfonoSimManager.cpp \
    dbus/OfonoModem.cpp \
    ofono.cpp \
    dbus/OfonoVoiceCall.cpp \
    phonebookentry.cpp \
    phonebookstorage.cpp

HEADERS  += dbus/OfonoVoiceCallManager.h \
    dbus/OfonoSimManager.h \
    dbus/OfonoModem.h \
    ofono.h \
    dbus/OfonoVoiceCall.h \
    phonebookentry.h \
    phonebookstorage.h

RESOURCES += \
    resources.qrc
