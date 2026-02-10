class AddCustomerReferenceToOrders < ActiveRecord::Migration[8.1]
  # def change
  #   add_reference :orders, :customer, null: false, foreign_key: true
  # end
  def change
    add_reference :orders, :customer, index: {unique:true}, foreign_key: true
  end
end
