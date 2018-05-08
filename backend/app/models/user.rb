# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :jobs
  mount_uploader :avatar_url, ImageIconUploader
  validates_confirmation_of :password, on: :create
  validates_uniqueness_of :name, :email, on: :create
  validates :name, :email, presence: { message: "can't be blank!" }

  def to_s
    username = "#{uid}@#{provider}"
    username = name if name
    username
  end
end
