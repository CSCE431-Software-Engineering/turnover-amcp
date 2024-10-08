# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'teams/index', type: :view do
  before(:each) do
    assign(:teams, [
             Team.create!(
               team_number: 2,
               member_count: 3
             ),
             Team.create!(
               team_number: 2,
               member_count: 3
             )
           ])
  end

  it 'renders a list of teams' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
  end
end
