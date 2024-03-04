# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'activities/index', type: :view do
  before(:each) do
    assign(:activities, [
             Activity.create!(
               event_name: 'Event Name',
               location: 'Location',
               description: 'Description',
               activity_type: 'Activity Type',
               points: 10,
               start_time: Time.current,
               end_time: Time.current + 1.hour
             ),
             Activity.create!(
               event_name: 'Event Name',
               location: 'Location',
               description: 'Description',
               activity_type: 'Activity Type',
               points: 20,
               start_time: Time.current,
               end_time: Time.current + 1.hour
             )
           ])
  end

  it 'renders a list of activities' do
    render
    assert_select 'div.activity', count: 2 do |activities|
      activities.each do |activity|
        assert_select activity, 'p', text: 'Event Name', count: 1
        assert_select activity, 'p', text: 'Location', count: 1
        assert_select activity, 'p', text: 'Description', count: 1
        assert_select activity, 'p', text: 'Activity Type', count: 1
        assert_select activity, 'p', text: /\d+ points/, count: 1
        assert_select activity, 'p', text: /\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}/, count: 2  # Assuming datetime format
      end
    end
  end
end
