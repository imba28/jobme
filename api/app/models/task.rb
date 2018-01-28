class Task < ApplicationRecord
  belongs_to :group
  belongs_to :user

  #enum done: [ :todo, :done ]
end