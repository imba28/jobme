class AddDoneToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :status, :string, :null => false, :default => 'todo'
  end
end