# app/models/member.rb
class Member < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  validates :email, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@(gmail\.com|tamu\.edu)\z/i, message: "must be a Gmail or TAMU email" }
  belongs_to :team, optional: true

  validates :team_id, presence: true, unless: :not_part_of_any_team?
  validate :team_exists_if_not_part_of_any_team

  has_many :participations
  has_many :activities, through: :participations

  private

  def not_part_of_any_team?
    team_id.nil? || team_id.zero?
  end

  def team_exists_if_not_part_of_any_team
    if !not_part_of_any_team? && !Team.exists?(team_id)
      errors.add(:team_id, "must exist")
    end
  end

  def self.from_google(email:, full_name:)
    # return nil unless email =~ /@mybusiness.com\z/
    return nil unless email =~ /\A[\w+\-.]+@(gmail.com|tamu.edu)\z/i
    member = find_or_initialize_by(email: email)

    if member.new_record? || member.email.blank?
      # Split full_name into first_name and last_name here
      member.first_name = full_name.split.first
      member.last_name = full_name.split.last
      member.points = 0
      member.is_admin = true
      member.paid_nat_dues = false
      member.paid_loc_dues = false
    end
    member.save!
    member
  end
end
