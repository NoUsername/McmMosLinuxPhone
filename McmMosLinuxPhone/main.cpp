#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "ofono.h"
#include <QDeclarativeContext>


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    Q_INIT_RESOURCE(resources);


    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.rootContext()->setContextProperty("OfonoContext", new Ofono());
    viewer.setSource(QUrl("qrc:/MainWindow.qml"));

    viewer.show();
    return app.exec();
}
