require 'rails_helper'

RSpec.describe "feedbacks/edit", type: :view do
  let(:feedback) {
    Feedback.create!(
      feedback: "MyString",
      email: "MyString",
      name: "MyString"
    )
  }

  before(:each) do
    assign(:feedback, feedback)
  end

  it "renders the edit feedback form" do
    render

    assert_select "form[action=?][method=?]", feedback_path(feedback), "post" do

      assert_select "input[name=?]", "feedback[feedback]"

      assert_select "input[name=?]", "feedback[email]"

      assert_select "input[name=?]", "feedback[name]"
    end
  end
end
