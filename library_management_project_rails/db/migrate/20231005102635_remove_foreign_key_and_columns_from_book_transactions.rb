class RemoveForeignKeyAndColumnsFromBookTransactions < ActiveRecord::Migration[7.0]
  def change
    # Remove the foreign key constraints
    remove_foreign_key :book_transactions, column: :books_id
    remove_foreign_key :book_transactions, :users

    # Remove the columns
    remove_column :book_transactions, :books_id
    remove_column :book_transactions, :user_id
  end
end
