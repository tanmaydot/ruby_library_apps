class AddRakAndSectionToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :rak, foreign_key: true
    add_reference :books, :section, foreign_key: true
  end
end
