class CreateVlog < ActiveRecord::Migration[8.1]
  def change
    create_table :vlogs do |t|
      t.string :title
      t.string :author
      t.string :description

      t.timestamps
    end
    add_index :vlogs, :title
  end
end
