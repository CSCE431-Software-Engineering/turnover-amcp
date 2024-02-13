class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.integer :team_number
      t.integer :member_count

      t.timestamps
    end
  end
end
