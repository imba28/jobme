class RenameSubcategoryIconUrl < ActiveRecord::Migration[5.1]
  def change
    rename_column :subcategories, :icon_url, :icon
  end
end
