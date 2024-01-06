class AddForeignKeysToAssociations < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :book_allotments, :admin_users, column: :admin_user_id
    add_foreign_key :book_allotments, :books, column: :book_id
    add_foreign_key :transactions, :admin_users, column: :admin_user_id
    add_foreign_key :transactions, :membership_plans, column: :mem_plan_id
  end
end
