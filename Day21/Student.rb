class Student
    def initialize(name , age)
        @name = name
        @age = age
    end
    def details 
        "Name:#{@name}\nAge:#{@age}"
    end
end
s1 = Student.new("Uday",20)
puts s1.details

class Teacher
    def initialize(name,age)
        @name = name
        @age = age
    end
    def details 
        "Name:#{@name}\nAge:#{@age}"
    end
end

s1 =  Student.object_id
s2 =  Teacher.object_id
puts s1
puts s2
puts s1==s2
puts Student.ancestors

