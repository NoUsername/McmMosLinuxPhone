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

class Ofono : public QObject
{
    Q_OBJECT
public:
    explicit Ofono(QObject *parent = 0);

signals:

public slots:
    void setPowerOn();
    void startPhoneCall(QString _number);
    void stopPhoneCall();

private://MEMBER-VARS
    OrgOfonoModemInterface* m_ofonoModemInterface;
    OrgOfonoVoiceCallManagerInterface* m_ofonoVoiceCallManagerInterface;
};

#endif // OFONO_H
