class AddShelfRefernceToBookModel < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :shelf, foreign_key: true
  end
end
