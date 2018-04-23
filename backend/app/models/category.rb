class Category < ApplicationRecord
    has_many :subcategories

    mount_uploader :icon_url, ImageIconUploader

    validates_processing_of :icon_url
    validate :image_size_validation

    private 
        def image_size_validation
                errors[:icon_url] << "should be less than 500KB" if icon_url.size > 0.5.megabytes 
        end
end
