class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :inviter_name

      t.string :invited_name
      t.string :invited_email

      t.timestamps
    end
  end
end
