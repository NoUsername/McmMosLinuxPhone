#ifndef PHONEBOOKENTRY_H
#define PHONEBOOKENTRY_H

#include <QString>
#include <QDateTime>

class PhonebookEntry
{
public:
    PhonebookEntry( QString _name, QString _phoneNumber);
signals:

public slots:
    void changeName(QString _name);
    void changePhoneNumber(QString _number);

private: //MEMBER_VARS
    QString m_name;
    QString m_phoneNumber;
};

#endif // PHONEBOOKENTRY_H
