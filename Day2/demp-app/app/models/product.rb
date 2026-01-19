class Product < ApplicationRecord
    @status  = Product.all.limit(10).pluck(:is_active)
    @price = Product.all.limit(10).pluck(:price) 
    @stock = Product.all.limit(10).pluck(:stock) 
    
end
