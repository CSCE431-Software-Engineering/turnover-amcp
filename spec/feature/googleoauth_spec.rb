require 'rails_helper'



RSpec.feature 'Google OAuth', type: :feature do

    scenario 'User signs in with Google' do
        setup_omniauth_mock
        user_sign_in_via_google
        visit root_path
        expect(page).to have_content('Welcome')
    end

    scenario 'User signs in with Google using wrong domain' do
        setup_omniauth_mock_fail
        user_sign_in_via_google
        visit root_path
        expect(page).to_not have_content('Welcome')
    end

    scenario 'User clicks on profile' do
        setup_omniauth_mock
        user_sign_in_via_google
        visit root_path
        visit profile_admins_path
        expect(page).to have_content('test@gmail.com')
        expect(page).to have_content('User')
    end

    scenario 'User edit profile' do
        setup_omniauth_mock
        user_sign_in_via_google
        visit root_path
        visit profile_admins_path
        visit edit_admin_path('123456789')
        fill_in 'admin_first_name', with: 'Ruiming'
        click_button 'Save changes'
        expect(page).to have_content('Ruiming')
    end
end