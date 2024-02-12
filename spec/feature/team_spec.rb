# location: spec/feature/team_spec.rb
require 'rails_helper'


RSpec.describe 'CRUD team', type: :feature do
  before do
    setup_omniauth_mock
    user_sign_in_via_google
  end
  
  scenario 'valid inputs' do
    visit new_team_path
    fill_in 'team[team_number]', with: '1'
    fill_in 'team[member_count]', with: '5'
    click_on 'Create Team'
    expect(page).to have_content('Team was successfully created.')
  end

  scenario 'No team number' do
    visit new_team_path
    fill_in 'team[team_number]', with: ''
    fill_in 'team[member_count]', with: '5'
    click_on 'Create Team'
    expect(page).to have_no_content('Team was successfully created.')
  end

  scenario 'No member count' do
    visit new_team_path
    fill_in 'team[team_number]', with: '4'
    fill_in 'team[member_count]', with: ''
    click_on 'Create Team'
    expect(page).to have_no_content('Team was successfully created.')
  end

  scenario 'No team number and no member count' do
    visit new_team_path
    fill_in 'team[team_number]', with: ''
    fill_in 'team[member_count]', with: ''
    click_on 'Create Team'
    expect(page).to have_no_content('Team was successfully created.')
  end

  scenario 'Delete team' do
    team = Team.create(team_number: '99', member_count: '7')
    visit teams_path
    click_on 'Show this team', match: :first
    click_on 'Destroy this team'
    expect(page).to have_content("Team was successfully destroyed.")
  end

  scenario 'Update team sunny' do
    team = Team.create(team_number: '99', member_count: '7')
    visit edit_team_path(team)
    fill_in 'team[team_number]', with: '8'
    fill_in 'team[member_count]', with: '45'
    click_on 'Update Team'
    expect(page).to have_content('Team was successfully updated.')
  end

  scenario 'Update team rainy' do
    team = Team.create(team_number: '99', member_count: '7')
    visit edit_team_path(team)
    fill_in 'team[team_number]', with: '8'
    fill_in 'team[member_count]', with: ''
    click_on 'Update Team'
    expect(page).to have_no_content('Team was successfully updated.')
  end
end
