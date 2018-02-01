class CreateInvitecodes < ActiveRecord::Migration[5.1]
  def change
    create_table :invitecodes do |t|
      t.string :code
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
