# frozen_string_literal: true

# HomeController is responsible for handling requests to the application's homepage.
# It inherits from ApplicationController to ensure consistency and application of any
# universal filters defined there, such as authentication. The controller includes actions
# to display the homepage, with specific content or redirects based on user state, such as
# whether an admin user is signed in. This provides a personalized experience for admin users
# by displaying a welcome message upon their return to the site.
class HomeController < ApplicationController
  def index
    return unless admin_signed_in?

    @message = 'Welcome back, Admin!'
  end
end
