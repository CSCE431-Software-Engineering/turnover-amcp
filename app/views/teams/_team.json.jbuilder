# frozen_string_literal: true

json.extract! team, :id, :team_number, :member_count, :created_at, :updated_at
json.url team_url(team, format: :json)
