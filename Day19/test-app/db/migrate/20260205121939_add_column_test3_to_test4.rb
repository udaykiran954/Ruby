class AddColumnTest3ToTest4 < ActiveRecord::Migration[8.1]
   def change
    add_column :test4s, :test3_id, :integer, default: 1, null: false
    # Add foreign key
    add_foreign_key :test4s, :test3s, column: :test3_id
  end
end
