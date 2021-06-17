#include "aes.h"
#include "Qt-AES/qaesencryption.h"
#include <QVariant>
#include <QByteArray>
#include <string>
#include <iostream>
#include <QDebug>

//AES::AES(QObject *parent) : QObject(parent)
//{
//    qDebug()<<"Зашеееееел";
//}
//bool AES::do_crypt(QString text,  QString key){
//    qDebug()<<"Сюда Зашеееееел";
//    QVariant test = encrypt(text.toUtf8(), key.toUtf8());
//    return true;
//}
//QVariant AES::encrypt(QString plainText, QString key)
//{
//    QByteArray iv;
//    quint8 iv_16[16]     = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f};
//       for (int i=0; i<16; i++)
//           iv.append(iv_16[i]);
//    qDebug()<<"Сюда Зашеееееел 1";
//  QAESEncryption encryption(QAESEncryption::AES_128, QAESEncryption::ECB);
//  qDebug()<<"Сюда Зашеееееел 2";
//  qDebug() << plainText << "\n Начало";
////  QByteArray QAESEncryption::encode(const QByteArray &rawText, const QByteArray &key, const QByteArray &iv)
//  QByteArray encodedText = encryption.Crypt(plainText.toUtf8(), key.toUtf8());
//  qDebug() << plainText << "\n Начало";
//  qDebug() << encodedText;
//  return encodedText;
//}

//QVariant AES::decrypt(QByteArray  encodedText, QByteArray  key)
//{
//  QAESEncryption encryption(QAESEncryption::AES_128, QAESEncryption::ECB);
//  QByteArray decodedText = encryption.decode(encodedText, key);
//  return QVariant::fromValue(encodedText);
//}
