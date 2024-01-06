class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :mem_start_date, :date
    add_column :users, :mem_end_date, :date
    add_column :users, :total_amount_paid, :integer
  end
end
