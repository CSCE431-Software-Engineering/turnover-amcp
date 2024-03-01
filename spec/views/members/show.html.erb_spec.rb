require 'rails_helper'

RSpec.describe "members/show", type: :view do
  before(:each) do
    assign(:member, Member.create!(
      team: nil,
      first_name: "First Name",
      last_name: "Last Name",
      points: 2,
      is_admin: false,
      email: "test@gmail.com",
      paid_nat_dues: false,
      paid_loc_dues: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
