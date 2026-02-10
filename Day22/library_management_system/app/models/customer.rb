class Customer < ApplicationRecord
    has_many :purchases
    has_many :books, through: :purchases
end
