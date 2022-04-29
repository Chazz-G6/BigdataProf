from re import S


class SchoolMember:
    def __init__(self,name, age):
        self.name = name
        self.age = age
        print("-----")
        
    def tell(self):
        print('Name:{} Age:{}'.format(self.name, self.age), end='')
p = SchoolMember('hong', 20)


class Teacher(SchoolMember):
    '''Represents a teacher.'''
    def __init__(self, name, age, salary):
        SchoolMember.__init__(self, name, age)
        self.salary = salary
        print('(Initialized Teacher: {})'.format(self.name))
        
    def tell(self):
        SchoolMember.tell(self)
        print('salary: "{:d}"'.format(self.salary))
        
class Student(SchoolMember):
    '''represents student'''
    
    def __init__(self, name, age, marks):
        SchoolMember.__init__(self, name, age)
        self.marks = marks
        print('(Initialized Student: {})'.format(self.name))
        
    def tell(self):
        SchoolMember.tell(self)
        print('Marks: "{:d}"'.format(self.marks))
        
t= Teacher('Mrs')