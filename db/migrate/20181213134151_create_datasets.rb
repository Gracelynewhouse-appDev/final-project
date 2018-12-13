class CreateDatasets < ActiveRecord::Migration[5.1]
  def change
    create_table :datasets do |t|
      t.string :data_type
      t.integer :number_rows

      t.timestamps
    end
  end
end
