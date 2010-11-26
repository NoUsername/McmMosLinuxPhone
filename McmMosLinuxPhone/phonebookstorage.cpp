#include "phonebookstorage.h"

PhonebookStorage::PhonebookStorage(QObject *parent) :
    QObject(parent)
{
    m_phonebookStorage = new QList<PhonebookEntry>();
    addStaticPhonebookEntries();
}

void PhonebookStorage::addStaticPhonebookEntries(){
    PhonebookEntry first("first","11111");
    PhonebookEntry second("second","22222");
    PhonebookEntry third("third","33333");

    addPhonebookEntry(first);
    addPhonebookEntry(second);
    addPhonebookEntry(third);
}

void PhonebookStorage::addPhonebookEntry(const PhonebookEntry &_entry){
    if(m_phonebookStorage != NULL){
        m_phonebookStorage->append(_entry);
    }
}

void PhonebookStorage::removePhonebookEntry(int _index){
    if(m_phonebookStorage != NULL && _index >= 0 && _index < m_phonebookStorage->size()){
        m_phonebookStorage->removeAt(_index);
    }
}

PhonebookEntry PhonebookStorage::getPhonebookEntry(int _index){
    if(_index >=0 && _index < m_phonebookStorage->length()){
        return m_phonebookStorage->at(_index);
    }
    //ERROR
    qDebug() << "[ERROR] PhonebookStorage::getPhonebookEntry(int) invalid index";
}
