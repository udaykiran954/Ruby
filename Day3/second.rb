=begin class Product 
    @@count = 1
    def initialize(id,name,model)
     @id = id
     @name = name
     @model = model
    end

    def get_all
        return "[name: "+@name+ "\n id: #{@id}"+"\n model: "+@model+"]"
    end

    def set_count
        @@count = @@count + 1
    end
    def get_count
        @@count
    end

end

p = Product.new(1,"car","benz");
=end
# puts Product.set_count
# p1 = Product.new(2,"car","bmw");
# puts Product.set_count
# puts p1.get_all
puts p.get_all
p.set_count
puts p.get_count
name = gets.chomp
puts name
n2 = gets.chomp
puts name+n2
