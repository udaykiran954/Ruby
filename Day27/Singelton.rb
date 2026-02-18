class Animal
    def any
        "all animals are eat"
    end
end

a1 = Animal.new 
a1.singleton_class.class_eval do
    def cat
        "hello i am a cat"
    end
end
class << a1 
    def drink
        "cat drink milk"
    end
end
puts a1.any
puts a1.cat
puts a1.drink

class Man
end
Man.class_eval do
    def m1
        "simple method"
    end
end
puts Man.new.m1
class Man
end
Man.instance_eval do
    def m2
        "simple method"
    end
end
puts Man.m2
obj = Man.new
obj.instance_eval do
    def method1
        "hello"
    end
end
puts obj.method1

class Vehicle
    def initialize(name,model)
        @name = name
        @model = model
    end
end
v = Vehicle.new("car","benz")
v.instance_eval do
    def m1
    puts @name
    end
end
v.m1
v.singleton_class.class_eval do 
    def m2
    puts @name
    end
end
v.m2
