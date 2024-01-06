class RenameMembershipTableAndModifyAdminUsers < ActiveRecord::Migration[6.1]
  def change
    # Rename the "memberships" table to "membership_plans"
    rename_table :memberships, :membership_plans

    # Remove the "membership_id" column from the "admin_users" table
    remove_column :admin_users, :membership_id

    # Remove columns from the "membership_plans" table
    remove_column :membership_plans, :amount
    remove_column :membership_plans, :start_date
    remove_column :membership_plans, :end_date

    # Add new columns to the "membership_plans" table
    add_column :membership_plans, :plan_amount, :integer
    add_column :membership_plans, :plan_date, :date
    add_column :membership_plans, :active, :integer

    # Add the "user_id" column to the "membership_plans" table
    add_column :membership_plans, :user_id, :bigint

    # Add a foreign key constraint for the "user_id" column
    add_foreign_key :membership_plans, :admin_users, column: :user_id, primary_key: :id
  end
end
