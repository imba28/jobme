class AddCreatorToTasks < ActiveRecord::Migration[5.1]
  def change
    add_reference :tasks, :creator, references: :users, index: true
    add_foreign_key :tasks, :users, column: :creator_id
  end
end