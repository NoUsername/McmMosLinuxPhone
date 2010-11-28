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
    qDebug("Ofonov PowerOn()");

}

Q_INVOKABLE void Ofonov::setPowerOff()
{
    qDebug("Ofonov setPowerOff()");
    emit this->incomingCall(QString("+4369911736993"));
}

void Ofonov::MOCall(QString _number)
{
    qDebug("Ofonov MOCall()");
    emit this->outgoingCall(QString("")+_number);
}
