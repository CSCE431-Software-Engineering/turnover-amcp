class Feedback < ApplicationRecord
  validates :feedback, presence: true

  # Set default values before validation if not present
  before_validation :set_defaults, on: [ :create, :update ]

  private
  
  def set_defaults
    self.name = 'Anonymous' if self.name.blank?
    self.email = 'N/A' if self.email.blank?
  end
end
