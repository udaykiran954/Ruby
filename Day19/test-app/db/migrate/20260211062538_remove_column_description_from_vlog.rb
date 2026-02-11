class RemoveColumnDescriptionFromVlog < ActiveRecord::Migration[8.1]
  def change
    remove_column :vlogs, :description, :string
  end
end
