class AddMembershipToAdminUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :admin_users, :membership_id, :integer
  end
end
