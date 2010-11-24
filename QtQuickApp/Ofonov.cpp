#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "Ofonov.h"
#include <QDeclarativeContext>

Ofonov::Ofonov(QObject *parent) :
    QObject(parent)
{
}

void Ofonov::setPowerOn()
{
    qDebug("Ofonov set PowerOn()");
    emit this->outgoingCall(QString("Message from CPP"));
}

Q_INVOKABLE void Ofonov::setPowerOff()
{
    qDebug("Ofonov set setPowerOff()");
    emit this->incomingCall(QString("Message from CPP"));
}
