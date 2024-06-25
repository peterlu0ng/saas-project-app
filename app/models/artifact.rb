class Artifact < ApplicationRecord
  # attr_accessor :photo
  has_one_attached :photo
  belongs_to :project

  validates_presence_of :name, :photo
  validates_uniqueness_of :name
  # validate :photo_file_size
  validate :acceptable_image



  private

  def acceptable_image
    return unless photo.attached?

    unless photo.blob.byte_size <= 2.megabyte
      errors.add(:upload, "must be less than 2mb")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(photo.content_type)
      errors.add(:upload, "must be a JPEG or PNG")
    end
  end

end
