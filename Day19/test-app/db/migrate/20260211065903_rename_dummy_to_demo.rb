class RenameDummyToDemo < ActiveRecord::Migration[8.1]
  def change
    rename_table :dummies,:demo
  end
end
