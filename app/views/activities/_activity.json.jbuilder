# frozen_string_literal: true

json.extract! activity, :id, :event_name, :start_time, :end_time, :location, :description,
              :activity_type, :points, :created_at, :updated_at
json.url activity_url(activity, format: :json)
