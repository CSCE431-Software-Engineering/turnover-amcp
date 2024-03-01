class Participation < ApplicationRecord
  belongs_to :member
  belongs_to :activity
end
