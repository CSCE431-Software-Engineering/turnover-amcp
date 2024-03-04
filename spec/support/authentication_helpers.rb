# frozen_string_literal: true

module AuthenticationHelpers
    def user_sign_in_via_google
      visit '/members/sign_in' # Adjust this path based on your actual route
      # The actual authentication is mocked by OmniAuth, no need to interact with Google's login page
      click_on 'Sign in with Google'
      current_user = Member.find_by(email: 'test@gmail.com')
      if current_user
        current_user.update(is_admin:true)
      end
    end
  end
  
  RSpec.configure do |config|
    config.include AuthenticationHelpers, type: :feature
  end