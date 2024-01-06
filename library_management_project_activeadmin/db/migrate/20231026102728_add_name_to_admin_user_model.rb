class AddNameToAdminUserModel < ActiveRecord::Migration[6.1]
  def change
    # Add new column to the "admin_users" table
    add_column :admin_users, :username, :name
  end
end
