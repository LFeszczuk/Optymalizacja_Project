# This Python file uses the following encoding: utf-8
import sys
import os

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QObject,Slot,Signal

class mainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    main=mainWindow()
    engine.rootContext().setContextProperty("backend",main)
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
