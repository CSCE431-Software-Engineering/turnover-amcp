# location: spec/feature/integration_spec.rb
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

RSpec.describe 'Creating feedback', type: :feature do
  scenario 'valid inputs' do
    visit new_feedback_path
    fill_in "feedback[name]", with: 'Test Testington'
    fill_in "feedback[email]", with: 'testing@email.com'
    fill_in "feedback[feedback]", with: 'This is testing the website'
    click_on 'Create Feedback'
    visit feedbacks_path
    expect(page).to have_content('This is testing the website')
  end
end