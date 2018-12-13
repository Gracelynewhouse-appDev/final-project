# == Schema Information
#
# Table name: training_runs
#
#  id             :integer          not null, primary key
#  model_id       :integer
#  dataset_id     :integer
#  iteration      :string
#  accuracy_score :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class TrainingRun < ApplicationRecord
   belongs_to :model
    belongs_to :dataset
    validates :iteration, :inclusion => { :in => [ '"first"', 
  '"second"', '"third"', '"fourth"', '"fifth"', '"sixth"', 
  '"seventh"', '"eighth"', '"ninth"', '"tenth or higher"' ] }
end
