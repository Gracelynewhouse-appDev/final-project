class CreateTrainingRuns < ActiveRecord::Migration[5.1]
  def change
    create_table :training_runs do |t|
      t.integer :model_id
      t.integer :dataset_id
      t.string :iteration
      t.float :accuracy_score

      t.timestamps
    end
  end
end
