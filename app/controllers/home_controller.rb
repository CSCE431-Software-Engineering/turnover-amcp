# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    return unless admin_signed_in?

    @message = 'Welcome back, Admin!'
  end
end
