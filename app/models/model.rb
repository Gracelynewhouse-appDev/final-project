# == Schema Information
#
# Table name: models
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Model < ApplicationRecord
    
    has_many :model_competancies
    has_many :training_runs
    
    validates :name, :presence => true
    validates :name, :uniqueness => true
end
