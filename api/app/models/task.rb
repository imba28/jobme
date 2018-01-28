class Task < ApplicationRecord
  belongs_to :group
  belongs_to :user

  enum status: [ :todo, :done ]
end