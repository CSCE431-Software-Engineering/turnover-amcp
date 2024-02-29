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
               start_time: Time.current,
               end_time: Time.current + 1.hour,
               start_date: Date.today,
               end_date: Date.today + 1.day
             ),
             Activity.create!(
               event_name: 'Event Name',
               location: 'Location',
               description: 'Description',
               activity_type: 'Activity Type',
               start_time: Time.current,
               end_time: Time.current + 1.hour,
               start_date: Date.today,
               end_date: Date.today + 1.day
             )
           ])
  end

  it 'renders a list of activities' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Event Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Location'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Description'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Activity Type'.to_s), count: 2
  end
end
