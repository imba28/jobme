class Job < ApplicationRecord
    has_and_belongs_to_many :subcategories
end
