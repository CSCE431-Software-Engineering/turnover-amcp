class HomeController < ApplicationController
  def index
    if member_signed_in?
      @message = "Welcome back, User!"
    end
  end
end
