require 'rails_helper'

RSpec.describe 'CRUD members', type: :feature do
  before do
    setup_omniauth_mock
    user_sign_in_via_google
  end

  describe 'Creating a member' do
    context 'with valid inputs' do
      it 'creates a member' do
        visit new_member_path
        fill_in 'member[first_name]', with: 'John'
        fill_in 'member[last_name]', with: 'Doe'
        fill_in 'member[points]', with: 100
        fill_in 'member[email]', with: 'john.doe@gmail.com'
        check 'member[is_admin]'
        check 'member[paid_loc_dues]'
        check 'member[paid_nat_dues]'
        click_on 'Create Member'
        expect(page).to have_content('Member was successfully created.')
      end
    end

    context 'with invalid inputs' do
      it 'does not create a member and shows error messages' do
        visit new_member_path
        click_on 'Create Member'
        expect(page).to have_content("First name can't be blank")
        expect(page).to have_content("Last name can't be blank")
        expect(page).to have_content("Points can't be blank")
        expect(page).to have_content("Email can't be blank")
        expect(page).to have_content("Email must be a Gmail or TAMU email")
      end
    end
  end

  describe 'Updating a member' do
    let!(:member) do
      Member.create(first_name: 'John', last_name: 'Doe', points: 100,
                    email: 'john.doe@gmail.com', is_admin: false,
                    paid_loc_dues: false, paid_nat_dues: false)
    end

    context 'with valid inputs' do
      it 'updates a member' do
        visit edit_member_path(member)
        fill_in 'member[first_name]', with: 'Updated John'
        fill_in 'member[last_name]', with: 'Updated Doe'
        fill_in 'member[points]', with: 200
        fill_in 'member[email]', with: 'updated_john.doe@gmail.com'
        check 'member[is_admin]'
        check 'member[paid_loc_dues]'
        check 'member[paid_nat_dues]'
        click_on 'Update Member'
        expect(page).to have_content('Member was successfully updated.')
      end
    end

    context 'with invalid inputs' do
      it 'does not update a member and shows error messages' do
        visit edit_member_path(member)
        fill_in 'member[first_name]', with: ''
        fill_in 'member[last_name]', with: ''
        fill_in 'member[points]', with: 0
        fill_in 'member[email]', with: ''
        uncheck 'member[is_admin]'
        uncheck 'member[paid_loc_dues]'
        uncheck 'member[paid_nat_dues]'
        click_on 'Update Member'
        expect(page).to have_content("First name can't be blank")
        expect(page).to have_content("Last name can't be blank")
        expect(page).to have_content("Email can't be blank")
      end
    end
  end
end