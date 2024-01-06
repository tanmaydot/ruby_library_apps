class CreateBookAllotments < ActiveRecord::Migration[6.1]
  def change
    create_table :book_allotments do |t|
      t.integer :book_transactions_type
      t.integer :admin_user_id
      t.integer :book_id
      t.integer :number_of_pieces

      t.timestamps
    end
  end
end
