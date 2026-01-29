class AddColumnDobToCustomer < ActiveRecord::Migration[8.1]
  def change
    add_column :customers, :Dob, :date
  end
end
