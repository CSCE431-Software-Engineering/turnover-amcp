require 'rails_helper'

RSpec.describe 'activities/new', type: :view do
  before(:each) do
    assign(:activity, Activity.new(
                        event_name: 'MyString',
                        location: 'MyString',
                        description: 'MyString',
                        activity_type: 'MyString'
                      ))
  end

  it 'renders new activity form' do
    render

    assert_select 'form[action=?][method=?]', activities_path, 'post' do
      assert_select 'input[name=?]', 'activity[event_name]'

      assert_select 'input[name=?]', 'activity[location]'

      assert_select 'input[name=?]', 'activity[description]'

      assert_select 'input[name=?]', 'activity[activity_type]'
    end
  end
end
