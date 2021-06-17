#include "webappcontroller.h"
#include <QNetworkRequest> // запрос
#include <QNetworkReply> // ответ
#include <QEventLoop> // (врезка обработки сигнала по месту действия)
// программа прерывается с режима ожидания, когда приходит объект и продолжает работу
#include <QDebug>
#include <QBitArray>
#include <string>
#include <iostream>
#include <QString>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QNetworkAccessManager>
#include <string.h>
#include <QHttpMultiPart>
#include <QUrlQuery>
#include <QUrl>
#include <QtWidgets/QTableView>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlTableModel>
#include <QtSql/QSqlError>



WebAppController::WebAppController(QObject *parent) : QObject(parent)
{
    nam = new QNetworkAccessManager();
    //database_read();

}

void WebAppController::GetNetworkValue()
{
    QNetworkRequest request;
    request.setUrl(QUrl("https://yandex.ru/pogoda/moscow"));
   // qDebug() << request.url() << " | request | " << request.rawHeaderList();
    QNetworkReply * reply;
   // qDebug() << " before get() ";

    QEventLoop event_loop;
    connect(nam, &QNetworkAccessManager::finished, &event_loop, &QEventLoop::quit);
    // заместо HttpController::SlotFinished и connect(nam, &QNetworkAccessManager::finished, this, &HttpController::SlotFinished)
    reply = nam->get(request);
    //обработали reply
    event_loop.exec(); // запуск цикла ожидания - происходит обработка других сигналов, пока не наступит QEventLoop::quit

    QByteArray replyString = reply -> readAll();
    emit signalSendToQML(QString(replyString), onPageInfo(QString(replyString)));
    // qDebug() << "СЛОВО dfghjk - " << QString("dfghjk").left(3); - метод left возвращает заданное количество символов

    //qDebug() << "BEGIN - " << QString(replyString) << " - END";
    //qDebug() << reply->url() << reply->rawHeaderList() << reply->readAll();

}

QString WebAppController::onPageInfo(QString replyString) {
//    QString needString = "temp__value temp__value_with-unit\"><";
    int x = replyString.indexOf("temp__value temp__value_with-unit\">") + 34;
    //int y = replyString.find("<", x);
    QString tempString = replyString.mid(x+1, 4);
    QString degreesNow = tempString.mid(0, tempString.indexOf("<")) + "°";
    qDebug() << replyString;
    qDebug() << degreesNow;// погода, вывод для отдельного значения - текущая температура

    return degreesNow;
}


QString WebAppController::auth(QString urlforauth)
{
    qDebug() << urlforauth << "выполнено oauth";
    if (urlforauth.contains("token_type=bearer&expires_in=") == true)
    {
        int a = urlforauth.indexOf("access_token=") + 13;
        int b = urlforauth.indexOf("&token_type");
        int c = b - a;
        urlforauth = urlforauth.mid(a, c);

        return urlforauth;
    }

    else if (urlforauth.contains("&error=access_denied&") == true)
    {
        return "Не удалось получить токен";
    }

    QString text = " ";
    return text;
}

bool WebAppController::authbool(QString urlforauth)
{
    qDebug() << urlforauth << "выполнено oauth";
    if (urlforauth.contains("token_type=bearer&expires_in=") == true)
    {
        int a = urlforauth.indexOf("access_token=") + 13;
        int b = urlforauth.indexOf("&token_type");
        int c = b - a;
        urlforauth = urlforauth.mid(a, c);
        qDebug() << urlforauth << "НАШ ТОКЕН";
        return 1;
    }

    else if (urlforauth.contains("&error=access_denied&") == true)
    {
        return 0;
    }

    return 0;
}

QByteArray WebAppController::requestReceivingAPI(QString token)
{
    token.prepend("OAuth ");
    QByteArray token_bytearray = token.toUtf8();
    QNetworkReply * reply;
    QEventLoop eventloop;
    connect(nam, &QNetworkAccessManager::finished, &eventloop, &QEventLoop::quit);
    QNetworkRequest request;
    request.setUrl(QUrl("https://cloud-api.yandex.net/v1/disk/resources/files?fields=name%2C%20created%2C%20size%2C%20preview&media_type=image&offset=0&preview_crop=true&preview_size=40"));
    request.setRawHeader(QByteArray("Authorization"), QByteArray(token_bytearray));
    reply = nam->get(request);
    eventloop.exec();
    QByteArray replyString = reply -> readAll();
    qDebug() << "\n\n\n\nОтветочка:\n" << replyString << request.url().toString() <<
                request.header(QNetworkRequest::ContentTypeHeader) << "\n\n\nКОНЕЦ ПОЛУЧЕНИЯ ОТВЕТА";

    parseJSON(replyString);

    return "authorised";

}

void WebAppController::parseJSON(QByteArray source)
{
    QJsonDocument jsonDoc = QJsonDocument::fromJson(source);  //распарсить json

    QJsonObject rootObject = jsonDoc.object();  //получение ссылки на корневой объект

    int size;
    QString name;
    QString created;
    QString preview;

    if (rootObject.contains("items") && rootObject["items"].isArray()) {
        QJsonValue items = rootObject.value("items");
        QJsonArray items_array = items.toArray();

        foreach (const QJsonValue & item, items_array) {
            QJsonObject itemobj = item.toObject();

            if (itemobj.contains("size")){
                QJsonValue size_value = itemobj.value("size");
                size = size_value.toInt();
            }

            if (itemobj.contains("name")){
                QJsonValue name_value = itemobj.value("name");
                name = name_value.toString();
            }

            if (itemobj.contains("created")){
                QJsonValue created_value = itemobj.value("created");
                created = created_value.toString().remove(9, 15);
            }

            if (itemobj.contains("file")){
                QJsonValue preview_value = itemobj.value("file");
                preview = preview_value.toString();
            }

            fileModel.addItem(FileObject(size, name, created, preview));
        }
    }

    qDebug() << "\n\n\\nНужные параметры:" << size << name << created << preview;
}




