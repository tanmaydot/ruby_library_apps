class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :book_title
      t.string :book_author
      t.string :book_summary
      t.integer :book_edition
      t.integer :book_total_stock

      t.timestamps
    end
  end
end
