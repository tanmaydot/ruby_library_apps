class AddMembershipReferenceToAdminUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :admin_users, :membership, foreign_key: true
  end
end
