class College
    @@college_name = "IIIT";
    def initialize(name,age)
        @teacher_name = name
        @teacher_age = age
    end
   def self.details
    "College name is #{@@college_name}"
   end
   def demonstrate
    "Your name is: #{@teacher_name}\nYour age is: #{@teacher_age}\n#{College.details}"
   end
   def demo
    "this is dummy instance method"
   end
   def method1
        "this is college method1"
    end
end
# puts College.new("uday",20).demonstrate

# module Course include College

# end 
#include
#puts Course.new.details
# puts Course.new.demo

module Mod1
    def method1
        "this is m1 module method1"
    end
end
module Mod2
     def method1
        "this is m2 module method1"
    end
end

class Student < College
    prepend Mod2,Mod1
    include Mod1,Mod2
    attr_accessor :name,:age
    # attr_reader :name,:age#restrict to read
    # attr_writer :name,:age#restrict to modify
    
    # def name # writing a way of getter
    #     @name
    # end
    # def name=(new_name) #way of writing a setter
    #     @name = new_name
    # end
    def initialize(name,age,cname,cage)
        super(cname,cage)
        @name = name
        @age = age
    end
    def demonstrate
        "Your name is: #{@name}\nAge is: #{@age} #{super}";
    end
end

# m = M.new("uday",21)
# puts m.method1
s1 = Student.new("raj",20,"uday",40)
puts s1.demonstrate
puts s1.method1

# class << self
#     def method1
#     end
# end

# Duck typing
# method overloading not allowed in ruby method overriding is allowed
# polymerphic true

