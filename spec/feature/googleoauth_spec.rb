# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Google OAuth', type: :feature do
  scenario 'User signs in with Google' do
    setup_omniauth_mock
    user_sign_in_via_google
    visit root_path
    expect(page).to have_content('Welcome back')
  end

  scenario 'User signs in with Google using wrong domain' do
    setup_omniauth_mock_fail
    user_sign_in_via_google
    visit root_path
    expect(page).to_not have_content('Welcome back')
  end
end