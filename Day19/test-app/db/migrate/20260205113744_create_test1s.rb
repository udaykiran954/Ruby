class CreateTest1s < ActiveRecord::Migration[8.1]
  def change
    create_table :test1s do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
