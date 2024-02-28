class HomeController < ApplicationController
  def index
    if admin_signed_in?
      @message = "Welcome back, Admin!"
    end
  end
end
