class User
    def add
        puts "Enter the name:"
        @name = gets.chomp
        puts "Enter the age:"
        @age = gets.chomp.to_i
    end
    def demonstrate
        puts "Name:#{@name}\nAge:#{@age}"
    end
end
user1 = User.new
user1.add
user1.demonstrate

#   def index
#     @students = Student.all
#   end
#   get 'students', to: 'students#index'
# validates :email, presence:true
# scope, unknown->{where('createdAt<=?',7.days.ago)}
# Student.create(name: "Uday", email: "uday@example.com")
# def product_params
#   params.expect(product: [:name, :email])
# end

# class Product < ApplicationRecord
#   has_many_attached :images
# end

# class Product < ApplicationRecord
#   has_rich_text :description
# end

