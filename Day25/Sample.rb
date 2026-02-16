class Student
    attr_accessor :name,:age
    # attr_reader :name,:age#restrict to read
    # attr_writer :name,:age#restrict to modify
    
    # def name # writing a way of getter
    #     @name
    # end
    # def name=(new_name) #way of writing a setter
    #     @name = new_name
    # end
    def initialize(name,age)
        @name = name
        @age = age
    end
    def demonstrate
        "Your name is: #{@name}\nAge is: #{@age}";
    end
end
s1 = Student.new("uday",21)
puts s1.demonstrate
puts s1.name
puts s1.age
s1.name = "kiran"
s1.age = 20
puts s1.demonstrate
# ruby allow operators, expressions in method definition
# s1.name = "kiran" 
# puts s1.name