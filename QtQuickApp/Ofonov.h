#ifndef OFONOV_H
#define OFONOV_H

#include <QObject>

class Ofonov : public QObject
{
    Q_OBJECT
public:
    explicit Ofonov(QObject *parent = 0);

signals:
    void incomingCall(QString id);
    void outgoingCall(QString id);

public slots:
    void setPowerOn();
    void MOCall(QString _number);

public:
    Q_INVOKABLE void setPowerOff();
};

#endif // OFONOV_H
