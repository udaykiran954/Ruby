class Purchase < ApplicationRecord
  belongs_to :book
  belongs_to :customer
  has_one :order
end
