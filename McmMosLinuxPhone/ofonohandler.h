#ifndef OFONOHANDLER_H
#define OFONOHANDLER_H

#include <QObject>
#include <QString>
#include <QDBusInterface>
#include <QStringList>
#include <QVariantMap>
#include <QList>
#include <QVariant>
#include <QDBusReply>
#include "dbus/OfonoModem.h"


class OfonoHandler : public QObject
{
    Q_OBJECT
public:
    explicit OfonoHandler(QObject *parent = 0);


private:

signals:

public slots:
    void startPhoneCall(const QString _number);
    void hangUpAll();
    void powerUp();
};

#endif // OFONOHANDLER_H
