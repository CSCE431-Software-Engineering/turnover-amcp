# frozen_string_literal: true
# ApplicationController serves as the base class for all controllers in the application.
# It inherits from ActionController::Base, providing a foundation for common behaviors
# across all controllers. This includes setting up universal filters and methods
# that are applicable to the entire application.
# Specifically, it enforces admin authentication before performing any actions,
# ensuring that only authenticated admin users can access certain functionalities.
class ApplicationController < ActionController::Base
  before_action :authenticate_admin!
end
