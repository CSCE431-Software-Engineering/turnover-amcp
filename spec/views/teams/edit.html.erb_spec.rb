require 'rails_helper'

RSpec.describe "teams/edit", type: :view do
  let(:team) {
    Team.create!(
      team_number: 1,
      member_count: 1
    )
  }

  before(:each) do
    assign(:team, team)
  end

  it "renders the edit team form" do
    render

    assert_select "form[action=?][method=?]", team_path(team), "post" do

      assert_select "input[name=?]", "team[team_number]"

      assert_select "input[name=?]", "team[member_count]"
    end
  end
end
