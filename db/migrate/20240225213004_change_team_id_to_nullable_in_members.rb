class ChangeTeamIdToNullableInMembers < ActiveRecord::Migration[7.0]
  def change
    change_column :members, :team_id, :integer, null: true
  end
end