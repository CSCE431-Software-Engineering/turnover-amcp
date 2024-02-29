require 'rails_helper'

RSpec.describe "members/new", type: :view do
  before(:each) do
    assign(:member, Member.new(
      team: nil,
      first_name: "MyString",
      last_name: "MyString",
      points: 1,
      is_admin: false,
      email: "test@gmail.com",
      paid_nat_dues: false,
      paid_loc_dues: false
    ))
  end

  it "renders new member form" do
    render

    assert_select "form[action=?][method=?]", members_path, "post" do

      assert_select "select[name=?]", "member[team_id]"

      assert_select "input[name=?]", "member[first_name]"

      assert_select "input[name=?]", "member[last_name]"

      assert_select "input[name=?]", "member[points]"

      assert_select "input[name=?]", "member[is_admin]"

      assert_select "input[name=?]", "member[email]"

      assert_select "input[name=?]", "member[paid_nat_dues]"

      assert_select "input[name=?]", "member[paid_loc_dues]"
    end
  end
end
