class CreateModelCompetancies < ActiveRecord::Migration[5.1]
  def change
    create_table :model_competancies do |t|
      t.integer :model_id
      t.integer :user_id

      t.timestamps
    end
  end
end
