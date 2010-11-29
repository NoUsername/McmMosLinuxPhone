#include "ofono.h"


Ofono::Ofono(QObject *parent) :
    QObject(parent)
{
    //INIT-MEMBER-VARS:
    m_ofonoModemInterface = new OrgOfonoModemInterface("org.ofono", "/phonesim", QDBusConnection::systemBus());
    m_ofonoVoiceCallManagerInterface = new OrgOfonoVoiceCallManagerInterface("org.ofono", "/phonesim", QDBusConnection::systemBus());

    QObject::connect(m_ofonoVoiceCallManagerInterface,SIGNAL(PropertyChanged(QString,QDBusVariant)),this,SLOT(propertyChanged(QString,QDBusVariant)));
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
            qDebug()<<"startPhoneCall";
            m_ofonoVoiceCallManagerInterface->Dial(_number,"default");
            emit outgoingCall(_number);
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
        qDebug()<<"phonecall stopped";
    }else{
        qDebug() << "[ERROR] Ofono::setPowerOn(): member var is NULL!";
    }
}

void Ofono::answerCall(){
    qDebug()<< "answer()";
    OrgOfonoVoiceCallInterface *call = new OrgOfonoVoiceCallInterface ("org.ofono", m_path, QDBusConnection::systemBus());
    QVariantMap properties=call->GetProperties();
    QVariant property=properties.value("State");
    QString value=property.value<QString>();
    if(value == "incoming"){
        call->Answer();
        qDebug() << "ansewered";
    }
}

void Ofono::propertyChanged(const QString &_name, const QDBusVariant &_value)
{
    qDebug() << "inside propertyChanged()";
    if(_name == "Calls")
    {
        const QVariant var = _value.variant();
        QDBusArgument dbusArgument = var.value<QDBusArgument>();
        //qDebug()<<var;
        dbusArgument.beginArray();
        while(!dbusArgument.atEnd())
        {
            QDBusObjectPath opath;
            dbusArgument >> opath;
            m_path = opath.path();
            OrgOfonoVoiceCallInterface *call = new OrgOfonoVoiceCallInterface ("org.ofono", m_path, QDBusConnection::systemBus());
            QVariantMap properties=call->GetProperties();
            QVariant property=properties.value("State");

            QString value=property.value<QString>();
            if(value=="dialing")
            {
                qDebug()<<"dialing";
            }
            else if(value=="incoming")
            {
                QVariant callIDProperty= properties.value("LineIdentification");
                QString callerID =callIDProperty.value<QString>();
                qDebug() << "incoming";
                emit incomingCall(callerID);
            }else if(value == ""){
                //what to do when phonecall is aborted?
                emit phoneCallAborted();
            }
        }
    }
}
