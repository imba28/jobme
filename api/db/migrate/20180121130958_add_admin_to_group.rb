class AddAdminToGroup < ActiveRecord::Migration[5.1]
  def change
    add_reference :groups, :admin, references: :users, index: true
    add_foreign_key :groups, :users, column: :admin_id
  end
end