class Project < ApplicationRecord
  validates :title, presence: true
  validates :details, presence: true
  has_many :artifacts, dependent: :destroy


end
