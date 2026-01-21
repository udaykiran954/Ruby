class Animal
    def eat
        "any animal can eat"
    end
    private 
    def drink
        "any animal can drink"
    end
    protected 
    def veg
        "some aninmals will eat veg only"
    end
end

class Dog < Animal
    def info
        puts eat
        puts veg #protected methods we can access in sub classes and same classes only
        puts drink #private methods we can access in sub classes and same classes only
        "Dog will eat non-veg"
    end
end

d = Dog.new
puts d.info
a = Animal.new 
# puts a.drink -->private methods we can't access outside of the class expicitly
#a.veg -->protected methods we can't access outside of the class expicitly

