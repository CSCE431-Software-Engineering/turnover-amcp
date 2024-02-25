require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        team: nil,
        first_name: "First Name",
        last_name: "Last Name",
        points: 2,
        is_admin: false,
        email: "Email",
        paid_nat_dues: false,
        paid_loc_dues: false
      ),
      Member.create!(
        team: nil,
        first_name: "First Name",
        last_name: "Last Name",
        points: 2,
        is_admin: false,
        email: "Email",
        paid_nat_dues: false,
        paid_loc_dues: false
      )
    ])
  end

  it "renders a list of members" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
