class Student:
    def __init__(self,name,grade,favClass,GPA,classes):
        self.name = name
        self.grade = grade
        self.favClass = favClass
        self.GPA = GPA
        self.classes = classes
    
    def introduction(self):
        print(f"Hello, my name is {self.name}. I am in grade {self.grade} and my favorite class is {self.favClass}.")

#s1 = Student("Amelia",12,"AP Chem",4.0,["orchestra","AP World","AP Chem"])
#s1.introduction()
#s2 = Student("Lily",12,"band",3.8,["band","AP Lang","AP World"])
#s2.introduction()



class Course:
    def __init__(self,name,teacher,numStudents,credits):
        self.name = name
        self.teacher = teacher
        self.numStudents = numStudents
        self.credits = credits

    def classDescription(self):
        print(f"The class {self.name} is taught by {self.teacher}. There are {self.numStudents} students in the class. The class is worth {self.credits} credits.")

#c1 = Course("AP Chem","Dr. Wilhelm",13,5)
#c1.classDescription()
#c2 = Course("band","Mr. Hopta",37,5)
#c2.classDescription()