class Product < ApplicationRecord
   has_many_attached :product_image
  has_one_attached :invoice
  has_rich_text :review
    # @status  = Product.all.limit(10).pluck(:is_active)
    # @price = Product.all.limit(10).pluck(:price) 
    # @stock = Product.all.limit(10).pluck(:stock) 
    # validates :stock, length: { minimum: 10, maximum: 20 }
    validates :name, format: { with: /\A[a-zA-Z0-9 ]+\z/, message: "Only alphanumeric allowed" }
    #validates :stock, numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 20}, if: :is_active?
    #validates :price, numericality: { greater_than_or_equal_to: 100 }
    validates :description, length: { maximum: 500 }, format: { with: /\A[a-zA-Z0-9 ]+\z/, message: "special characters are not allowed"}
    validates :is_active, acceptance: true

    #validate :check_price
    
    scope :out_of_stock, -> {where("stock <= ?", 0)}
   # scope :test_scope, -> query{} #we can write the raw sql query
   # scope :out_of_stock, -> { where(stock: 0)}
   # scope :whitelisted_products,  -> { where("id IN (?)", [1, 2, 3]) }
   scope :price_greater,->(price){where("price >= ?",price)}
    def check_price
        if price>0 && !is_active
            errors.add :price ,"when price greater than 0 when isactive is true vice versa"
        end
    end

   # validate :check_stock
    def check_stock
        if stock>0 && !is_active
            errors.add :stock ,"when stock greater than 0 when isactive is true vice versa"
        end
    end

  

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
            return apply_discount(10).round
        else
            return "Product not available"
        end
    end 
end
