# frozen_string_literal: true

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
    fill_in 'Start time', with: '2024-02-05 06:54:00' # Assuming datetime format
    fill_in 'End time', with: '2024-02-05 17:55:00'   # Assuming datetime format
    fill_in 'Location', with: 'Texas A&M'
    fill_in 'Description', with: 'sdfdfl;fjs'
    fill_in 'Activity type', with: 'Camp'
    fill_in 'Points', with: '100' # Example value for points

    click_button 'Create Activity'

    expect(page).to have_content('Activity was successfully created.')
    expect(page).to have_content('Event name: Camp')
    expect(page).to have_content('Start time: 2024-02-05 06:54:00')
    expect(page).to have_content('End time: 2024-02-05 17:55:00')
    expect(page).to have_content('Location: Texas A&M')
    expect(page).to have_content('Description: sdfdfl;fjs')
    expect(page).to have_content('Activity type: Camp')
    expect(page).to have_content('Points: 100')
  end
end
