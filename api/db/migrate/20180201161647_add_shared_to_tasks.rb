class AddSharedToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :share, :integer, :null => false, :default => 0
  end
end