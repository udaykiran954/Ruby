class RenamePhoneNumberColumnInCustomers < ActiveRecord::Migration[8.1]
  def change
    rename_column :customers, :Phone_number, :phone_number
  end
end
