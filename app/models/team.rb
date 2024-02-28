# frozen_string_literal: true

class Team < ApplicationRecord
  validates :team_number, :member_count, numericality: { only_integer: true }
end
