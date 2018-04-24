class RenameIconColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :jobs, :gif_url, :image
    add_column :jobs, :image_preview, :string
  end
end
