#include "ofonohandler.h"

OfonoHandler::OfonoHandler(QObject *parent) :
    QObject(parent)
{
    powerUp();
}

void OfonoHandler::startPhoneCall(const QString _number){
    if(this != NULL && _number != NULL){

    }
}

void OfonoHandler::hangUpAll(){
    if(this != NULL){

    }
}

void OfonoHandler::powerUp(){
    OrgOfonoModemInterface ofono("org.ofono", "/phonesim",
    QDBusConnection::systemBus());
    ofono.SetProperty("Powered", QDBusVariant(true));
}
