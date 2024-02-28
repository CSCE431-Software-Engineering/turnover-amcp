# frozen_string_literal: true

class Activity < ApplicationRecord
  validates :event_name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :activity_type, presence: true
end
