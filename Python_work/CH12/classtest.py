class Person:
    name=''
    def __init__(self, name):
        self.name=name
    def say_hi(self):
        print('Hello Class', self.name)
        
p = Person('python')

p.name = 'java'
p.say_hi()