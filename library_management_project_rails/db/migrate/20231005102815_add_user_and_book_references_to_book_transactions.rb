class AddUserAndBookReferencesToBookTransactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :book_transactions, :user, null: false, foreign_key: true
    add_reference :book_transactions, :book, null: false, foreign_key: true
  end
end
