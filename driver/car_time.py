from datetime import datetime

class Car_Time:
    def __init__(self):
        pass

    def get_hour(self):
        return (datetime.now().strftime("%H:%M:%S") )

    def get_date(self):
        return datetime.now().strftime("%d-%m-%Y")

if __name__=="__main__":
    Car = Car_Time()
    print(Car.get_hour())
    print(Car.get_date())