class Job < ApplicationRecord
  has_and_belongs_to_many :subcategories

  mount_uploader :image, ImageIconUploader

  validates_processing_of :image
  validate :image_size_validation

  private

  def image_size_validation
    errors[:image] << 'should be less than 2MB' if image.size > 2.megabytes
  end
end
