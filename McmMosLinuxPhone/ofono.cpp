#include "ofono.h"


Ofono::Ofono(QObject *parent) :
    QObject(parent)
{
    //INIT-MEMBER-VARS:
    m_ofonoModemInterface = new OrgOfonoModemInterface("org.ofono", "/phonesim", QDBusConnection::systemBus());
    m_ofonoVoiceCallManagerInterface = new OrgOfonoVoiceCallManagerInterface("org.ofono", "/phonesim", QDBusConnection::systemBus());

    //setPowerOn();
    //startPhoneCall("1234666");
    stopPhoneCall();
}

void Ofono::setPowerOn() {
    if(m_ofonoModemInterface != NULL){
        m_ofonoModemInterface->SetProperty("Powered", QDBusVariant(true));
    }else{
        qDebug() << "[ERROR] Ofono::setPowerOn(): member var is NULL!";
    }
}

void Ofono::startPhoneCall(QString _number){
    if(m_ofonoVoiceCallManagerInterface != NULL){
        if(_number != NULL && _number.length() > 0){
            m_ofonoVoiceCallManagerInterface->Dial(_number,"default");
        }else{
            qDebug() << "[ERROR] Ofono::startPhoneCall(): number is null or not a valid number!";
        }
    }else{
        qDebug() << "[ERROR] Ofono::startPhoneCall(): member var is NULL!";
    }
}

void Ofono::stopPhoneCall(){
    if(m_ofonoVoiceCallManagerInterface != NULL){
        m_ofonoVoiceCallManagerInterface->HangupAll();
    }else{
        qDebug() << "[ERROR] Ofono::setPowerOn(): member var is NULL!";
    }
}

void Ofono::PropertyChanged(const QString &name, const QDBusVariant &value)
{
    if(name == "Calls")
    {
        const QVariant var = value.variant();
        const QDBusArgument a = var.value<QDBusArgument>();
        //qDebug()<<var;
        a.beginArray();
        while(!a.atEnd())
        {
            QDBusObjectPath opath;
            a >> opath;
            OrgOfonoVoiceCallInterface *call = new OrgOfonoVoiceCallInterface ("org.ofono", opath.path(), QDBusConnection::systemBus());
            QVariantMap properties=call->GetProperties();
            QVariant property=properties.value("State");
            QString value=property.value<QString>();
            if(value=="dialing")
            {
                qDebug()<<"dialing";
            }
            else if(value=="incoming")
            {
                qDebug() << "incoming";
            }
        }
    }
}
