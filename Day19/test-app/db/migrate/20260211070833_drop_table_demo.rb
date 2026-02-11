class DropTableDemo < ActiveRecord::Migration[8.1]
  def change
     drop_table :demo do |t|
      t.string :name

      t.timestamps
    end
  end
end
