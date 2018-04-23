class CreateJobSubcategoryJoins < ActiveRecord::Migration[5.1]
  def change
    create_table :job_subcategory_joins do |t|
      t.references :job, foreign_key: true
      t.references :subcategory, foreign_key: true

      t.timestamps
    end
  end
end
