# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'activities/edit', type: :view do
  let(:activity) do
    Activity.create!(
      event_name: 'MyString',
      location: 'MyString',
      description: 'MyString',
      activity_type: 'MyString',
      points: 10,
      start_time: Time.current,
      end_time: Time.current + 1.hour
    )
  end

  before(:each) do
    assign(:activity, activity)
  end

  it 'renders the edit activity form' do
    render

    assert_select 'form[action=?][method=?]', activity_path(activity), 'post' do
      assert_select 'input[name=?]', 'activity[event_name]'
      assert_select 'input[name=?]', 'activity[location]'
      assert_select 'input[name=?]', 'activity[description]'
      assert_select 'input[name=?]', 'activity[activity_type]'
      assert_select 'input[name=?]', 'activity[points]'
      assert_select 'input[name=?][type=?]', 'activity[start_time]', 'datetime-local'
      assert_select 'input[name=?][type=?]', 'activity[end_time]', 'datetime-local'
    end
  end
end
