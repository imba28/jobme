class Group < ApplicationRecord
  belongs_to :admin, class_name: "User"
  has_many :memberships
  has_many :users, through: :memberships
  has_many :tasks
end