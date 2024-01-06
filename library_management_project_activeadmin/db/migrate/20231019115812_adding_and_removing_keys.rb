class AddingAndRemovingKeys < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :admin_users, column: "mem_plan_id"
    remove_foreign_key :membership_plans, column: "user_id"

    remove_column :membership_plans, :user_id
    remove_column :admin_users, :mem_plan_id


  end
end
