class AddDoneToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :done, :integer, :null => false, :default => 0
  end
end