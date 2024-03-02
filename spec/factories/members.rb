FactoryBot.define do
  factory :member do
    team { nil }
    first_name { "MyString" }
    last_name { "MyString" }
    points { 1 }
    is_admin { true }
    email { "test@gmail.com" }
    paid_nat_dues { false }
    paid_loc_dues { false }
  end
end
