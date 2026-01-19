# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#Product.destroy_all #this command used for clean up the database

# Product.create([{
#   name: "node js",description: "it is coding",price:6000,stock: 30,is_active: true  
# },{
#     name: "express js",description: "it is coding",price:6000,stock: 30,is_active: true
# },{
#     name: "service js",description: "it is coding",price:6000,stock: 30,is_active: true
# }])
 10.times do
 Product.create(
    name: Faker:: Commerce.product_name,
    description: "this is sample decription",
    price: Faker:: Commerce.price(range: 2000..3000),
    stock: rand(10..20),
    is_active: [true,false].sample # sample will give random value from the given array
)
end
    
