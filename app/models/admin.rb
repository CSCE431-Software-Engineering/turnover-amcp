# frozen_string_literal: true

# The Admin model represents an administrative user within the application.
# It is configured to use Devise for authentication, with support for
# OmniAuth-based authentication via Google OAuth2. This setup allows admins
# to sign in using their Google or TAMU (Texas A&M University) email addresses.
# The model includes validations for the presence and specific format of email addresses,
# ensuring they are either Gmail or TAMU emails. Additionally, the model provides a
# class method `from_google` for creating or updating admin records based on data
# received from Google OAuth2 authentication.
#
# Attributes:
# - email: String, the admin's email address, must be Gmail or TAMU.
# - full_name: String, the admin's full name, split into first and last names for storage.
# - uid: String, a unique identifier provided by Google OAuth2.
# - avatar_url: String, URL of the admin's avatar image from Google.
class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  validates :email, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@(gmail\.com|tamu\.edu)\z/i, message: 'must be a Gmail or TAMU email' }
  def self.from_google(email:, full_name:, uid:, avatar_url:)
    # return nil unless email =~ /@mybusiness.com\z/
    return nil unless email =~ /\A[\w+\-.]+@(gmail.com|tamu.edu)\z/i

    admin = find_or_initialize_by(email:)

    if admin.new_record? || admin.uid.blank?
      admin.uid = uid
      admin.avatar_url = avatar_url
      # Split full_name into first_name and last_name here
      admin.first_name = full_name.split.first
      admin.last_name = full_name.split.last

    end
    admin.save!
    admin
  end
end
