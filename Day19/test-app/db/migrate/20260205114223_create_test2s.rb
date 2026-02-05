class CreateTest2s < ActiveRecord::Migration[8.1]
  def change
    create_table :test2s do |t|
      t.string :name
      t.references :test1, null: false, foreign_key: true

      t.timestamps
    end
  end
end
