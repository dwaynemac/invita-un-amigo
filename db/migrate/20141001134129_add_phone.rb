class AddPhone < ActiveRecord::Migration
  def change
    add_column :invitations, :invited_phone, :string
  end
end
