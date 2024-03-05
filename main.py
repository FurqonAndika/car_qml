# This Python file uses the following encoding: utf-8
import sys
from pathlib import Path

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5 import QtCore
from PyQt5.QtCore import  QThread
import random

from driver.car_time import Car_Time

from driver.worker import Worker



class Dashboard:
    def __init__(self):
        app = QGuiApplication(sys.argv)
        self.engine = QQmlApplicationEngine()
        qml_file = Path(__file__).resolve().parent / "main.qml"
        self.engine.load(str(qml_file))
        if not self.engine.rootObjects():
            sys.exit(-1)

        self.kecepatan =0 
        self.voltage = 0  
        self.temperature = 0
        self.rpm = 0 
        self.engine_temp = 0
        self.current = 0  

        self.get_component()

        # timer = QtCore.QTimer(interval=500)
        # timer.timeout.connect(self.light)
        # timer.start()
        timer2 = QtCore.QTimer(interval=100)
        timer2.timeout.connect(self.speed)
      
        timer2.start()

        self.Cartime = Car_Time()
        Time_Timer = QtCore.QTimer(interval=1000)
        Time_Timer.timeout.connect(self.update_time)
        Time_Timer.start()

                
        self.thread = QThread()
        self.worker = Worker()
        self.worker.moveToThread(self.thread)
        self.thread.started.connect(self.worker.run)
        self.worker.finished.connect(self.thread.quit)
        self.worker.finished.connect(self.worker.deleteLater)
        self.thread.finished.connect(self.thread.deleteLater)
        self.worker.progress.connect(self.show)
        # Start the thread to get data from micro
        self.thread.start()                
        sys.exit(app.exec_())

    def show(self, data):
        # data=rpm,speed,voltage,current,enginetemp,temp,long,lat
        self.data_income = data
        self.data_income = self.data_income.replace('data=','')
        self.data_income = self.data_income.replace('/','')
        x = self.data_income.split(',')
        try:
                self.rpm = int(x[0])
                self.kecepatan = int(x[1])
                self.voltage = int(x[2])
                self.current = int(x[3])
                self.engine_temp  = int (x[4])
                self.temperature = int (x[5])        
        except :
                pass
        # s= self.engine.rootObjects()[0].findChild(QtCore.QObject, "speed") 
        # s.setProperty("value",self.kecepatan) 

    def get_component(self):
        self.hour_label = self.engine.rootObjects()[0].findChild(QtCore.QObject, "hour_label")

    def speed(self):
        s= self.engine.rootObjects()[0].findChild(QtCore.QObject, "speed")  
        voltage= self.engine.rootObjects()[0].findChild(QtCore.QObject, "voltage")  
        temperature = self.engine.rootObjects()[0].findChild(QtCore.QObject,'temperature')
        engine_temperature = self.engine.rootObjects()[0].findChild(QtCore.QObject,'engine_temp')
        rpm = self.engine.rootObjects()[0].findChild(QtCore.QObject,'rpm')
        current = self.engine.rootObjects()[0].findChild(QtCore.QObject,'current')
        # val = random.randint(0,200)
        
        # self.kecepatan +=1
        # if self.kecepatan>200:
        #    self.kecepatan =0
        s.setProperty("value",self.kecepatan) 
        voltage.setProperty("text",str(self.voltage)+' V') 
        temperature.setProperty("text", str(self.temperature)+" °C")
        engine_temperature.setProperty("text", str(self.engine_temp)+" °C")
        rpm.setProperty("value", self.rpm)
        current.setProperty("text", str(self.current)+" A")
        
        # r = self.engine.rootObjects()[0].findChild(QtCore.QObject, "foo_object")      
        # r.setProperty("text", str(self.kecepatan))  


    def light(self):
        rightSign= self.engine.rootObjects()[0].findChild(QtCore.QObject, "rightLight")
        rightSign.setProperty('visible', not rightSign.property('visible'))
        # print((rightSign.property('visible')))

      
    def update_time(self):
        self.hour_label = self.engine.rootObjects()[0].findChild(QtCore.QObject, "hour_label")
        self.hour_label.setProperty('text', str(self.Cartime.get_hour()))
        self.engine.rootObjects()[0].findChild(QtCore.QObject, "date_label").setProperty('text', str(self.Cartime.get_date()))
        # print(dir(self.hour_label))
        # self.engine.rootObjects()[0].findChild(QtCore.QObject, "batteryValue").setProperty('persen', round(random.uniform(0, 1), 2))
        self.engine.rootObjects()[0].findChild(QtCore.QObject, "batteryValue").setProperty('persen', 1)


if __name__ == "__main__":
    Dash = Dashboard()
        



  



