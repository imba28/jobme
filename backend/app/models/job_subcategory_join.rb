class JobSubcategoryJoin < ApplicationRecord
  belongs_to :job
  belongs_to :subcategory
end
