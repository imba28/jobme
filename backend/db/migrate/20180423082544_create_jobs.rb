class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :gif_url
      t.text :description

      t.timestamps
    end
  end
end
