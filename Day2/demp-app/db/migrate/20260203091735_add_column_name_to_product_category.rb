class AddColumnNameToProductCategory < ActiveRecord::Migration[8.1]
  def change
    add_column :product_categories, :category_name, :string
  end
end
