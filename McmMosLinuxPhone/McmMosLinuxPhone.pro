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
    ofono.cpp

HEADERS  += mainwindow.h \
    dbus/OfonoVoiceCallManager.h \
    dbus/OfonoSimManager.h \
    dbus/OfonoModem.h \
    ofono.h

FORMS    += mainwindow.ui
