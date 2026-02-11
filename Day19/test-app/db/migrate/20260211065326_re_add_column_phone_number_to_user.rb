class ReAddColumnPhoneNumberToUser < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :phone_number, :integer
    add_index :users, :phone_number
  end
end
