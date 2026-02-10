class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.references :purchase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
