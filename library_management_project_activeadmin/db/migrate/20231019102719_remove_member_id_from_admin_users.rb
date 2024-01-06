class RemoveMemberIdFromAdminUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :admin_users, :membership_id, :integer
  end
end
