require 'rails_helper'

RSpec.describe 'teams/new', type: :view do
  before(:each) do
    assign(:team, Team.new(
                    team_number: 1,
                    member_count: 1
                  ))
  end

  it 'renders new team form' do
    render

    assert_select 'form[action=?][method=?]', teams_path, 'post' do
      assert_select 'input[name=?]', 'team[team_number]'

      assert_select 'input[name=?]', 'team[member_count]'
    end
  end
end
