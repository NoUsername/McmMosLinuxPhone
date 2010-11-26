#include "phonebookentry.h"

PhonebookEntry::PhonebookEntry(QString _name, QString _phoneNumber){
    if(_name != NULL && _phoneNumber != NULL){
        changeName(_name);
        changePhoneNumber(_phoneNumber);
    }
}

void PhonebookEntry::changeName(QString _name){
    if(_name != NULL){
        m_name = _name;
    }
}

void PhonebookEntry::changePhoneNumber(QString _number){
    if(_number != NULL){
        m_phoneNumber = _number;
    }
}
