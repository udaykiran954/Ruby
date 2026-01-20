class Base2 
    def welcome
        "welcoming you from base2 class"
    end
end

class Base < Base2
    # def welcome
    #     "welcoming you from base class"
    # end
end

class Child < Base
    def welcome
        puts super
        "welocming you from child class"
    end
    def puts
        super
        "this is puts method n child class"
    end
end

obj = Child.new
# puts obj.welcome
# puts Child.ancestors
puts obj.puts
# Child->Base->Object->Kernel->BasicObject (inheritance hieracy method look up)
# puts obj.respond_to?(:welcome)
# puts "uday".respond_to?(:upcase)
# puts 10.respond_to?(:round)
