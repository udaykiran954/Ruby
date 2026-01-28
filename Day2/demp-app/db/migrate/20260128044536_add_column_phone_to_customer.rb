class AddColumnPhoneToCustomer < ActiveRecord::Migration[8.1]
  def change
    add_column :customers, :Phone_number, :integer
  end
end
