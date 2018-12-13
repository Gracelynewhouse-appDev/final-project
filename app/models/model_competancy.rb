# == Schema Information
#
# Table name: model_competancies
#
#  id         :integer          not null, primary key
#  model_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ModelCompetancy < ApplicationRecord
    belongs_to :user
  belongs_to :model
end
