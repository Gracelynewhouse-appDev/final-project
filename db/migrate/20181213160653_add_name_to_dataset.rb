class AddNameToDataset < ActiveRecord::Migration[5.1]
  def change
    add_column :datasets, :name, :string
  end
end
