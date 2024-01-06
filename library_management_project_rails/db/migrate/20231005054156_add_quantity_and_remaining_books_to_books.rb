class AddQuantityAndRemainingBooksToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :quantity, :integer
    add_column :books, :remaining_books, :integer
  end
end
