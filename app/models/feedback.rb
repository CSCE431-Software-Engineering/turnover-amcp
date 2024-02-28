# frozen_string_literal: true

class Feedback < ApplicationRecord
  validates :feedback, presence: true

  # Set default values before validation if not present
  before_validation :set_defaults, on: %i[create update]

  private

  def set_defaults
    self.name = 'Anonymous' if name.blank?
    self.email = 'N/A' if email.blank?
  end
end
