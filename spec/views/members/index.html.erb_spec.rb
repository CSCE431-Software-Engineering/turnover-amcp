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
        email: "test@gmail.com",
        paid_nat_dues: false,
        paid_loc_dues: false
      ),
      Member.create!(
        team: nil,
        first_name: "First Name",
        last_name: "Last Name",
        points: 2,
        is_admin: false,
        email: "test@tamu.edu",
        paid_nat_dues: false,
        paid_loc_dues: false
      )
    ])
  end

  it "renders a list of members" do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new('None'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: /\bNo\b/, count: 6
    assert_select cell_selector, text: Regexp.new("test@tamu.edu".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("test@gmail.com".to_s), count: 1
  end
end
