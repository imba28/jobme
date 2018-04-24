class ChangeCategoryIconName < ActiveRecord::Migration[5.1]
  def change
    rename_column :categories, :icon_url, :icon
  end
end
