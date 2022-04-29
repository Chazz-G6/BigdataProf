
class Robot:
    population=0
    
    def __init__(self,name):
        self.name = name
        print("초기화{}".format(self.name))
        Robot.population += 1
        
    def die(self):
        print("{} is 삭제됨".format(self.name))
        Robot.population -= 1
        
        if Robot.population == 0 :
            print ("{} 마지막으로 삭제. ".format(self.name))
        else:
            print("아직 {:d}개 남아 있음.".format(Robot.population))
    def __del__(self):
        print("소멸자 호출")

    def say_hi(self):
        """설명문."""
        
        print("반갑다 {}.".format(self.name))
    @classmethod
    def how_many(cls):
        """몇개임?"""
        print("{:d} 개임.".format(cls.population))
        
### end of class robot
        
droid1 = Robot("R2-D2")
droid1.say_hi()
Robot.how_many()

droid2 = Robot("C-3PO")
droid2.say_hi()
Robot.how_many()

print ("\nRobots can do some work here.\n")
print ("Robots have finished their work. So let's destroy them.")
droid1.die()
droid2.die()
Robot.how_many()

