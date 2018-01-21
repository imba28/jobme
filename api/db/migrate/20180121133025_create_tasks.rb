class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :due_date

      t.timestamps
    end
  end
end
