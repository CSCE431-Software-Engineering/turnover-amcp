class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.references :team, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.integer :points
      t.boolean :is_admin
      t.string :email
      t.boolean :paid_nat_dues
      t.boolean :paid_loc_dues

      t.timestamps
    end
  end
end
