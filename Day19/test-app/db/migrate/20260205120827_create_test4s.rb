class CreateTest4s < ActiveRecord::Migration[8.1]
  def change
    create_table :test4s do |t|
      t.string :name

      t.timestamps
    end
  end
end
