class User < ApplicationRecord
  has_secure_password
  #has_and_belongs_to_many :groups
  has_many :tasks
  has_many :memberships
  has_many :groups, through: :memberships
end