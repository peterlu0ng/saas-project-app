class Project < ApplicationRecord
  validates :title, presence: true
  validates :details, presence: true


end
