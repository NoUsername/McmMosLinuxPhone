#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "Ofonov.h"

#include <QDeclarativeContext>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.rootContext()->setContextProperty("OfonoContext", new Ofonov());
    viewer.setMainQmlFile(QLatin1String("qml/mainWindow.qml"));
    viewer.show();
    return app.exec();
}
