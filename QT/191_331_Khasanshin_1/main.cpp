#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include "webappcontroller.h"
#include "yandexdiskmodel.h"
#include <QQmlContext>
#include "aes.h"
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    WebAppController WebAppController;

    yandexdiskmodel filemodel;

    AES AES;

    app.setWindowIcon(QIcon("vk.png"));



    QQmlApplicationEngine engine;

    /* register AES class into QML */
//    qmlRegisterType<AES>("com.myapp.demo", 1, 0, "AES");



    QQmlContext * context = engine.rootContext(); //дерево объектов в QML движке
    context->setContextProperty("WebAppController", &WebAppController);//приводим в соответствие имя сишному объекту - поместить С++ объект в область видимости QML
    context->setContextProperty("filemodel", &WebAppController.fileModel);
    context->setContextProperty("AES", &AES);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    QObject * mainWindow = engine.rootObjects().first();
    QObject::connect(mainWindow, SIGNAL(signalMakeRequestHTTP()), &WebAppController, SLOT(GetNetworkValue()));
    return app.exec();
}
