class Participation < ApplicationRecord
  belongs_to :member
  belongs_to :activity

  validates :member_id, uniqueness: { scope: :activity_id, message: "has already signed up for this activity" }
end
