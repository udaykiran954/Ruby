class ModifyColumnPhoneNumberInUser < ActiveRecord::Migration[8.1]
  def change
    change_column :users,:phone_number,:string
  end
end
