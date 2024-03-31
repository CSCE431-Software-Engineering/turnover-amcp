# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'activities/show', type: :view do
  include Devise::Test::ControllerHelpers
  before(:each) do
    @activity = assign(:activity, Activity.create!(
                                    event_name: 'Event Name',
                                    location: 'Location',
                                    description: 'Description',
                                    activity_type: 'Activity Type',
                                    points: 10,
                                    start_time: Time.current,
                                    end_time: Time.current + 1.hour
                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Event Name/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Activity Type/)
    expect(rendered).to match(/10/) # For points
    expect(rendered).to match(Regexp.new(@activity.start_time.to_s))
    expect(rendered).to match(Regexp.new(@activity.end_time.to_s))
  end
end
