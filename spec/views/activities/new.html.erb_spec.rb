# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'activities/new', type: :view do
  
  before(:each) do
    assign(:activity, Activity.new(
                        event_name: 'MyString',
                        location: 'MyString',
                        description: 'MyString',
                        activity_type: 'MyString',
                        points: 10,
                        start_time: Time.current,
                        end_time: Time.current + 1.hour
                      ))
  end

  it 'renders new activity form' do
    render

    assert_select 'form[action=?][method=?]', activities_path, 'post' do
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
