class AddUniqueIndexToParticipations < ActiveRecord::Migration[7.0]
  def change
    add_index :participations, [:member_id, :activity_id], unique: true
  end
end
