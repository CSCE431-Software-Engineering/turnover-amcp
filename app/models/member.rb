# app/models/member.rb
class Member < ApplicationRecord
  belongs_to :team, optional: true

  validates :team_id, presence: true, unless: :not_part_of_any_team?
  validate :team_exists_if_not_part_of_any_team

  private

  def not_part_of_any_team?
    team_id.nil? || team_id.zero?
  end

  def team_exists_if_not_part_of_any_team
    if !not_part_of_any_team? && !Team.exists?(team_id)
      errors.add(:team_id, "must exist")
    end
  end
end
