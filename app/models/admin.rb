class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    # return nil unless email =~ /@mybusiness.com\z/
    return nil unless email =~ /\A[\w+\-.]+@(gmail.com|tamu.edu)\z/i
    admin = find_or_initialize_by(email: email)

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
