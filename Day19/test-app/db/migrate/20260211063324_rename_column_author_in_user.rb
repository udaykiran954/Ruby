class RenameColumnAuthorInUser < ActiveRecord::Migration[8.1]
  def change
    rename_column :users, :name, :user_name
  end
end
