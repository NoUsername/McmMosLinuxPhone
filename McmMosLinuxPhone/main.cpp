#include <QtGui/QApplication>
#include "Ofonov.h"
#include "qmlapplicationviewer.h"

#include <QDeclarativeContext>


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    Q_INIT_RESOURCE(resources);


    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.rootContext()->setContextProperty("OfonoContext", new Ofonov());
    viewer.setSource(QUrl("qrc:/MainWindow.qml"));

    viewer.show();
    return app.exec();
}
