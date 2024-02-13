require 'rails_helper'

RSpec.describe "teams/show", type: :view do
  before(:each) do
    assign(:team, Team.create!(
      team_number: 2,
      member_count: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
