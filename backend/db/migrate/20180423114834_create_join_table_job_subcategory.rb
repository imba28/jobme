class CreateJoinTableJobSubcategory < ActiveRecord::Migration[5.1]
  def change
    create_join_table :jobs, :subcategories do |t|
      t.index %i[job_id subcategory_id]
      t.index %i[subcategory_id job_id]
    end
  end
end
