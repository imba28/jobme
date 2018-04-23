class AddLoginPasswordsUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password_digest, :string
    remove_column :users, :pwd, :string
    remove_column :users, :job, :references
  end
end
