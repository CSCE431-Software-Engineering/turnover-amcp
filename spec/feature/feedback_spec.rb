# frozen_string_literal: true

# location: spec/feature/feedback_spec.rb
require 'rails_helper'

# Example Test

# RSpec.describe 'Creating a book', type: :feature do
#   scenario 'valid inputs' do
#     visit new_book_path
#     fill_in "book[title]", with: 'harry potter'
#     click_on 'Create Book'
#     visit books_path
#     expect(page).to have_content('harry potter')
#   end
# end

RSpec.describe 'CRUD feedback', type: :feature do
  before do
    setup_omniauth_mock
    user_sign_in_via_google
  end

  scenario 'valid inputs' do
    visit new_feedback_path
    fill_in 'feedback[name]', with: 'Test Testington'
    fill_in 'feedback[email]', with: 'testing@email.com'
    fill_in 'feedback[feedback]', with: 'This is testing the website'
    click_on 'Create Feedback'
    expect(page).to have_content('Feedback was successfully created.')
  end

  scenario 'No name' do
    visit new_feedback_path
    fill_in 'feedback[name]', with: ''
    fill_in 'feedback[email]', with: 'testing@email.com'
    fill_in 'feedback[feedback]', with: 'This is testing no name'
    click_on 'Create Feedback'
    expect(page).to have_content('Feedback was successfully created.')
  end

  scenario 'No email' do
    visit new_feedback_path
    fill_in 'feedback[name]', with: 'Test Testington'
    fill_in 'feedback[email]', with: ''
    fill_in 'feedback[feedback]', with: 'This is testing no email'
    click_on 'Create Feedback'
    expect(page).to have_content('Feedback was successfully created.')
  end

  scenario 'No name and email' do
    visit new_feedback_path
    fill_in 'feedback[name]', with: ''
    fill_in 'feedback[email]', with: ''
    fill_in 'feedback[feedback]', with: 'This is testing no name or email'
    click_on 'Create Feedback'
    visit feedbacks_path
    expect(page).to have_content('This is testing no name or email')
  end

  scenario 'No feedback' do
    visit new_feedback_path
    fill_in 'feedback[name]', with: 'Test Testington'
    fill_in 'feedback[email]', with: 'testing@email.com'
    fill_in 'feedback[feedback]', with: ''
    click_on 'Create Feedback'
    expect(page).to have_content('1 error prohibited this feedback from being saved:')
  end

  scenario 'Delete feedback' do
    Feedback.create(name: 'Test Testington', email: 'testing@email.com', feedback: 'Feedback')
    visit feedbacks_path
    click_on 'Show this feedback', match: :first
    click_on 'Destroy this feedback'
    expect(page).to have_content('Feedback was successfully destroyed.')
  end

  scenario 'Update feedback sunny' do
    feedback = Feedback.create(name: 'Test Testington', email: 'test@email.com', feedback: 'feedback')
    visit edit_feedback_path(feedback)
    fill_in 'feedback[name]', with: 'Updated Test Testington'
    fill_in 'feedback[email]', with: 'updated_testing@email.com'
    fill_in 'feedback[feedback]', with: 'This is updated testing of the website'
    click_on 'Update Feedback'
    expect(page).to have_content('Feedback was successfully updated.')
  end

  scenario 'Update feedback rainy' do
    feedback = Feedback.create(name: 'Test Testington', email: 'test@email.com', feedback: 'feedback')
    visit edit_feedback_path(feedback)
    fill_in 'feedback[name]', with: 'Updated Test Testington'
    fill_in 'feedback[email]', with: 'updated_testing@email.com'
    fill_in 'feedback[feedback]', with: ''
    click_on 'Update Feedback'
    expect(page).to have_content('1 error prohibited this feedback from being saved:')
  end
end
