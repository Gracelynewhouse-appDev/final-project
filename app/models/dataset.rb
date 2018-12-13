# == Schema Information
#
# Table name: datasets
#
#  id          :integer          not null, primary key
#  data_type   :string
#  number_rows :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string
#

class Dataset < ApplicationRecord
  has_many :training_runs
  validates :name, :presence => true, :uniqueness => true
  validates :number_rows, :presence => true, :numericality => { :greater_than => 0 }
  validates :data_type, :presence => true
end
