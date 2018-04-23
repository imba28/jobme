class AddChildhoodToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :chilhood, :integer
  end
end
