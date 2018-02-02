class Task < ApplicationRecord
  belongs_to :group
  belongs_to :user
  belongs_to :creator, class_name: "User", optional: true
  #enum done: [ :todo, :done ]
end