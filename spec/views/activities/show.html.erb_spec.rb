# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'activities/show', type: :view do
  before(:each) do
    assign(:activity, Activity.create!(
                        event_name: 'Event Name',
                        location: 'Location',
                        description: 'Description',
                        activity_type: 'Activity Type',
                        start_time: Time.current,
                        end_time: Time.current + 1.hour,
                        start_date: Date.today,
                        end_date: Date.today + 1.day
                      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Event Name/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Activity Type/)
  end
end
