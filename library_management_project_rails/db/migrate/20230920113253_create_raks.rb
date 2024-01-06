class CreateRaks < ActiveRecord::Migration[7.0]
  def change
    create_table :raks do |t|
      t.string :name

      t.timestamps
    end
  end
end
