class Car:
    name=''
    velocity=''
    distance = 0
    
    def __init__(self,name):
        self.name = name
        
    def sayCarName(self):
        print("차종 : {}".format(self.name))
    def accelate(self, speed, min):
        self.velocity = speed
        self.distance += speed / 60 * min
    def printDistance(self):
        print("총 이동거리는  {:.1f}".format(self.distance))
        
sonata = Car('소나타')

while True:
    vel = int(input("이동한 속도를 입력하세요."))
    if vel == 0:
        break
    time = int(input("이동한 시간(분)을 입력하세요."))

    Car.accelate(Car,vel,time)
    print(Car.distance)
    Car.printDistance(Car)
    
    
print("프로그램 종료...")