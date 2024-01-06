class AddingAndRemovingColumns < ActiveRecord::Migration[6.1]
  def change
    # Remove columns from the "membership_plans" table
    remove_column :membership_plans, :validity

    # Add new columns to the "admin_users" table
    add_column :admin_users, :mem_plan_id, :integer

    # Add a foreign key
    add_foreign_key :admin_users, :membership_plans, column: :mem_plan_id, primary_key: :id
  end
end
