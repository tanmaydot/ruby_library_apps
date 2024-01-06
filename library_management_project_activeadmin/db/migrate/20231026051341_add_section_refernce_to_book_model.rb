class AddSectionRefernceToBookModel < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :section, foreign_key: true
  end
end
