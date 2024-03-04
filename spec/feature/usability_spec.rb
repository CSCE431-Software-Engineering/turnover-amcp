# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Hotbar', type: :feature do
  scenario 'User navigates to calendar using hotbar' do
    setup_omniauth_mock
    user_sign_in_via_google
    visit root_path
    click_link 'Calendar'
    expect(page).to have_content('Previous')
    expect(page).to have_content('Today')
    expect(page).to have_content('Next')
  end

  scenario 'User navigates to member using hotbar' do
    setup_omniauth_mock
    user_sign_in_via_google
    visit root_path
    click_link 'Members'
    expect(page).to have_content('Email')
    expect(page).to have_content('Paid National Dues')
    expect(page).to have_content('Admin')
  end

  scenario 'User navigates to teams using hotbar' do
    setup_omniauth_mock
    user_sign_in_via_google
    visit root_path
    click_link 'Teams'
    expect(page).to have_content('New team')
  end

  scenario 'User navigates to activities using hotbar' do
    setup_omniauth_mock
    user_sign_in_via_google
    visit root_path
    click_link 'Activities'
    expect(page).to have_content('New activity')
  end
end
