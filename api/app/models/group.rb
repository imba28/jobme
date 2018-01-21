class Group < ApplicationRecord
  belongs_to :admin, class_name: "User"
  has_many :tasks
end