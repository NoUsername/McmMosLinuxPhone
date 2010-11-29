#include "ofono.h"


Ofono::Ofono(QObject *parent) :
    QObject(parent)
{
    //INIT-MEMBER-VARS:
    m_ofonoModemInterface = new OrgOfonoModemInterface("org.ofono", "/phonesim", QDBusConnection::systemBus());
    m_ofonoVoiceCallManagerInterface = new OrgOfonoVoiceCallManagerInterface("org.ofono", "/phonesim", QDBusConnection::systemBus());

    QObject::connect(m_ofonoVoiceCallManagerInterface,SIGNAL(PropertyChanged(QString,QDBusVariant)),this,SLOT(propertyChanged(QString,QDBusVariant)));
    QObject::connect(this,SIGNAL(incomingCall(OrgOfonoVoiceCallInterface*)),this,SLOT(answer(OrgOfonoVoiceCallInterface*)));
}

void Ofono::setPowerOn() {
    if(m_ofonoModemInterface != NULL){
        m_ofonoModemInterface->SetProperty("Powered", QDBusVariant(true));
    }else{
        qDebug() << "[ERROR] Ofono::setPowerOn(): member var is NULL!";
    }
}

void Ofono::setPowerOff(){
    if(m_ofonoModemInterface != NULL){
        m_ofonoModemInterface->SetProperty("Powered", QDBusVariant(false));
    }else{
        qDebug() << "[ERROR] Ofono::setPowerOff(): member var is NULL!";
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

void Ofono::answer(OrgOfonoVoiceCallInterface *_call){
    if(_call != NULL){
        QVariantMap properties=_call->GetProperties();
        QVariant property=properties.value("State");
        QString value=property.value<QString>();
        qDebug()<< "answer()";
        if(value == "incoming"){
            _call->Answer();
            qDebug() << "ansewered";
        }
    }
}

void Ofono::propertyChanged(const QString &_name, const QDBusVariant &_value)
{
    qDebug() << "inside propertyChanged()";
    if(_name == "Calls")
    {
        const QVariant var = _value.variant();
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
                emit incomingCall(call);
            }
        }
    }
}
