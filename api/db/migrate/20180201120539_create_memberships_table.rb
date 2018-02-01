class CreateMembershipsTable < ActiveRecord::Migration[5.1]
  def change
    drop_join_table :groups, :users

    create_table :memberships do |t|
      t.belongs_to :group, index: true
      t.belongs_to :user, index: true
      t.integer :membership_type, :null => false, :default => 0
    end
  end
end