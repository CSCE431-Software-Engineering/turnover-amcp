require 'rails_helper'

RSpec.describe "activities/edit", type: :view do
  let(:activity) {
    Activity.create!(
      event_name: "MyString",
      location: "MyString",
      description: "MyString",
      activity_type: "MyString"
    )
  }

  before(:each) do
    assign(:activity, activity)
  end

  it "renders the edit activity form" do
    render

    assert_select "form[action=?][method=?]", activity_path(activity), "post" do

      assert_select "input[name=?]", "activity[event_name]"

      assert_select "input[name=?]", "activity[location]"

      assert_select "input[name=?]", "activity[description]"

      assert_select "input[name=?]", "activity[activity_type]"
    end
  end
end
