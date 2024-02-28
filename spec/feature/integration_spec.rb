# spec/features/activity_spec.rb

require 'rails_helper'

RSpec.describe 'Activity management', type: :feature do
  before do
    setup_omniauth_mock
    user_sign_in_via_google
  end

  scenario 'User creates a new activity' do
    visit new_activity_path

    fill_in 'Event name', with: 'Camp'
    fill_in 'Start time', with: '06:54:00'
    fill_in 'End time', with: '17:55:00'
    fill_in 'Start date', with: '2024-02-05'
    fill_in 'End date', with: '2024-02-14'
    fill_in 'Location', with: 'Texas A&M'
    fill_in 'Description', with: 'sdfdfl;fjs'
    fill_in 'Activity type', with: 'Camp'

    click_button 'Create Activity'

    expect(page).to have_content('Activity was successfully created.')
    expect(page).to have_content('Event name: Camp')
    expect(page).to have_content('Start time: 06:54:00')
    expect(page).to have_content('End time: 17:55:00')
    expect(page).to have_content('Start date: 2024-02-05')
    expect(page).to have_content('End date: 2024-02-14')
    expect(page).to have_content('Location: Texas A&M')
    expect(page).to have_content('Description: sdfdfl;fjs')
    expect(page).to have_content('Activity type: Camp')
  end
end
