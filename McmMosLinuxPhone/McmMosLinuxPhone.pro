#-------------------------------------------------
#
# Project created by QtCreator 2010-11-24T10:33:19
#
#-------------------------------------------------

QT       += core gui

TARGET = McmMosLinuxPhone
TEMPLATE = app

CONFIG += qdbus

SOURCES += main.cpp\
        mainwindow.cpp \
    dbus/OfonoVoiceCallManager.cpp \
    dbus/OfonoSimManager.cpp \
    dbus/OfonoModem.cpp \
    ofono.cpp \
<<<<<<< Updated upstream
    dbus/OfonoVoiceCall.cpp
=======
    phonebookentry.cpp \
    phonebookstorage.cpp
>>>>>>> Stashed changes

HEADERS  += mainwindow.h \
    dbus/OfonoVoiceCallManager.h \
    dbus/OfonoSimManager.h \
    dbus/OfonoModem.h \
    ofono.h \
<<<<<<< Updated upstream
    dbus/OfonoVoiceCall.h
=======
    phonebookentry.h \
    phonebookstorage.h
>>>>>>> Stashed changes

FORMS    += mainwindow.ui
