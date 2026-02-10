class Offer < ApplicationRecord
    # has_many :products, through: :product_offers
    has_many :subscriptions 
    has_many :products,through: :subscriptions
end
