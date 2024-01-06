class CreatingNewColumn < ActiveRecord::Migration[6.1]
  def change
    # Remove columns from the "membership_plans" table
    remove_column :membership_plans, :plan_date

    # Add new columns to the "admin_users" table
    add_column :admin_users, :mem_end_date, :date
    add_column :admin_users, :mem_start_date, :date
    add_column :admin_users, :total_amount_paid, :integer

    # Add new columns to the "membership_plans" table
    add_column :membership_plans, :total_days, :integer
    add_column :membership_plans, :plan_name, :string
  end
end
