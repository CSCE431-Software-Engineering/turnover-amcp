json.extract! activity, :id, :event_name, :start_time, :end_time, :start_date, :end_date, :location, :description, :activity_type, :created_at, :updated_at
json.url activity_url(activity, format: :json)
