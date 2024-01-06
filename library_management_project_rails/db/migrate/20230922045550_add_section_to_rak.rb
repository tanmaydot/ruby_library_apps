class AddSectionToRak < ActiveRecord::Migration[7.0]
  def change
    add_reference :raks, :section, foreign_key: true
  end
end
