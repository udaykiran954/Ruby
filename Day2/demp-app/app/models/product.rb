class Product < ApplicationRecord
    # @status  = Product.all.limit(10).pluck(:is_active)
    # @price = Product.all.limit(10).pluck(:price) 
    # @stock = Product.all.limit(10).pluck(:stock) 

    def check_availability
        if stock>0
             true
        else
             false
        end
    end

    def apply_discount(discount_percent)
            amount = price + (price*(discount_percent/100))
        return amount
    end

    def total_amount
        if check_availability
            return apply_discount(10)
        else
            return "Product not available"
        end
    end 
end
