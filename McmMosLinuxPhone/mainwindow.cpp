#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "ofono.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    new Ofono();
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}
