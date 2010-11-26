#ifndef PHONEBOOKSTORAGE_H
#define PHONEBOOKSTORAGE_H

#include <QObject>
#include "phonebookentry.h"
#include <QList>
#include <QDebug>

class PhonebookStorage : public QObject
{
    Q_OBJECT
public: //CONSTRUCTORS
    explicit PhonebookStorage(QObject *parent = 0);

public://METHODS
    void addStaticPhonebookEntries();
    PhonebookEntry getPhonebookEntry(int _index);
signals:

public slots:
    void addPhonebookEntry(const PhonebookEntry &_entry);
    void removePhonebookEntry(int _index);


private: //MEMBER_VARS
    QList<PhonebookEntry> *m_phonebookStorage;
};

#endif // PHONEBOOKSTORAGE_H
