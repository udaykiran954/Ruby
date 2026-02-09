class Age
    def age
        puts "Enter the age";
        @age = gets.chomp.to_i
        @age
    end
    def after_five
        puts "after the five years age is #{@age.to_i + 5}";
    end
end
a = Age.new
a.age
a.after_five