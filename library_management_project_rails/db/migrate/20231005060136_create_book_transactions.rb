class CreateBookTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :book_transactions do |t|
      t.integer :status
      t.date :expected_date

      t.timestamps
    end
  end
end
