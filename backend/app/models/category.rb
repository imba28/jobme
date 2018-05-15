# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :subcategories

  mount_uploader :icon, ImageIconUploader

  validates_processing_of :icon
  validate :image_size_validation

  private

  def image_size_validation
    errors[:icon] << 'should be less than 500KB' if icon.size > 0.5.megabytes
  end
end
