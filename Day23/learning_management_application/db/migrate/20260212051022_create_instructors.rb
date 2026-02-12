class CreateInstructors < ActiveRecord::Migration[8.1]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :email
      t.string :specialization
      t.integer :experince

      t.timestamps
    end
  end
end
