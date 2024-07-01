class Project < ApplicationRecord
  validates :title, presence: true
  validates :details, presence: true
  has_many :artifacts, dependent: :destroy
  belongs_to :user
  validate :free_plan_can_only_have_one_project

  def free_plan_can_only_have_one_project
    if self.new_record? && (user.projects.count > 0) && (user.paid? == false)
      errors.add(:base, "Free plans cannot have more than one project")
    end

end
end
