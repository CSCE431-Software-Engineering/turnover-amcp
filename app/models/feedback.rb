# frozen_string_literal: true

# Feedback model represents feedback entries in the application.
# It includes validations to ensure that feedback is always present.
# Additionally, it uses callbacks to set default values for name and email
# before validation, ensuring that every feedback has this information,
# even if it is provided as 'Anonymous' or 'N/A'. This model encapsulates
# the behavior and data related to user feedback, ensuring data integrity
# and providing a layer of business logic for handling feedback entries.
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
