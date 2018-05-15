# frozen_string_literal: true

class Subcategory < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :jobs

  mount_uploader :icon, ImageIconUploader

  validates_processing_of :icon
  validate :image_size_validation

  private

  def image_size_validation
    puts 'yes'
    errors[:icon] << 'should be less than 500KB' if icon.size > 0.5.megabytes
  end
end
