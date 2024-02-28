# frozen_string_literal: true

# Team model represents team entities within the application.
# It includes validations for team_number and member_count to ensure
# they are integers, enforcing data integrity for these attributes.
# This model serves as a key part of the application's team management
# feature, providing a structured way to store and validate data related
# to teams, facilitating operations like creation, update, and querying of team information.
class Team < ApplicationRecord
  validates :team_number, :member_count, numericality: { only_integer: true }
end
