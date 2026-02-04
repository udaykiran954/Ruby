class Student
    PI = 3.14
    @@college = "IIIT";
    def initialize(id,name,age)
        @id = id;
        @name = name;
        @age = age;
    end
    def toString
        "id: #{@id}\nname: #{@name}\nage: #{@age}\ncollege: #{@@college}";
    end
    def self.college_name
        @@college
    end
end 
s1 = Student.new(1,"uday",20);
puts s1.toString
$country = "india";
puts Student.college_name
