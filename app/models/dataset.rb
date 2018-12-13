# == Schema Information
#
# Table name: datasets
#
#  id          :integer          not null, primary key
#  data_type   :string
#  number_rows :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Dataset < ApplicationRecord
  has_many :training_runs
  validates :number_rows, :numericality => { :greater_than => 0 }
  validates :data_type, :presence => true
end
