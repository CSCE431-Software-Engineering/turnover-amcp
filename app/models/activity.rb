# frozen_string_literal: true

# Activity model represents an event or activity within the application.
# It includes various fields such as event_name, start_time, end_time,
# start_date, end_date, location, description, and activity_type, each of which
# is validated for presence to ensure that all activities have complete and
# meaningful information. This model inherits from ApplicationRecord, which
# provides it with a set of functionalities for interacting with the application's database.
class Activity < ApplicationRecord
  validates :event_name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :activity_type, presence: true

  has_many :participations
  has_many :members, through: :participations
  
end
