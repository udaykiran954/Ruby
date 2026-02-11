class RemoveColumnPhoneNumberFromUser < ActiveRecord::Migration[8.1]
  def change
    remove_index :users, :phone_number
    remove_column :users, :phone_number, :string
  end
end
