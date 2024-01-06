class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.decimal :amount
      t.date :start_date
      t.date :end_date
      t.integer :validity

      t.timestamps
    end
  end
end
