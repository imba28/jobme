class AddJobsToUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :job_id, :integer
    create_join_table :users, :jobs do |t|
       t.index [:job_id, :user_id]
       t.index [:user_id, :job_id]
    end
  end
end
