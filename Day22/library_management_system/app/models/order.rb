class Order < ApplicationRecord
  belongs_to :purchase
  has_many :addresses
end
