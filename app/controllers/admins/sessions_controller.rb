# frozen_string_literal: true

# Admins::SessionsController customizes the session management for admins.
# It inherits from Devise::SessionsController to leverage Devise's default
# session handling mechanisms while providing an opportunity to extend or
# modify the session management behavior specific to admin users.
# This can include actions such as creating (sign in), destroying (sign out),
# and even potentially custom actions related to admin session management.
module Admins
  class SessionsController < Devise::SessionsController
    def after_sign_out_path_for(_resource_or_scope)
      new_admin_session_path
    end

    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || root_path
    end
  end
end
