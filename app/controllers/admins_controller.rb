# frozen_string_literal: true
# AdminsController manages all actions related to Admin resources.
# This includes creating, updating, deleting, and displaying admins.
# It inherits from ApplicationController to leverage common functionality
# across the application.
# app/controllers/admins_controller.rb
class AdminsController < ApplicationController
  before_action :authenticate_admin! # Ensure the admin is logged in
  before_action :set_admin, only: %i[show edit update]

  def show; end

  def profile
    @admin = current_admin # Assuming Devise and current_admin helper is available
    render :show # Optionally, you can render the same view as 'show' if it fits
  end

  def edit; end

  def update
    if @admin.update(admin_params)
      redirect_to @admin, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def set_admin
    @admin = current_admin # Assumes Devise for authentication
  end

  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :avatar_url)
  end

  def profiles
    @admins = Admin.all
    Rails.logger.debug "@admins set to: #{@admins.inspect}"
  end
end
