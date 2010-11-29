#ifndef OFONO_H
#define OFONO_H

#include <QObject>
#include "dbus/OfonoModem.h"
#include "dbus/OfonoSimManager.h"
#include "dbus/OfonoVoiceCallManager.h"
#include "QDBusConnection"
#include <QDBusVariant>
#include <QString>
#include <QDebug>
#include "dbus/OfonoVoiceCall.h"

class Ofono : public QObject
{
    Q_OBJECT
public:
    explicit Ofono(QObject *parent = 0);

signals:
    void incomingCall(QString id);

signals://from qml
    void outgoingCall(QString id);

signals: //to qml
    void phoneCallAborted();

public slots:
    void setPowerOn();
    void setPowerOff();
    void startPhoneCall(QString _number);
    void stopPhoneCall();
    void propertyChanged(const QString &_name,const QDBusVariant &_value);
    void answerCall();

private://MEMBER-VARS
    OrgOfonoModemInterface* m_ofonoModemInterface;
    OrgOfonoVoiceCallManagerInterface* m_ofonoVoiceCallManagerInterface;
    QString m_path;
};

#endif // OFONO_H
