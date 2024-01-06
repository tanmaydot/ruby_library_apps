class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :mem_plan_id
      t.integer :admin_user_id

      t.timestamps
    end
  end
end
