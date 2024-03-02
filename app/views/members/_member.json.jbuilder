json.extract! member, :id, :team_id, :first_name, :last_name, :points, :is_admin, :email, :paid_nat_dues, :paid_loc_dues, :created_at, :updated_at
json.url member_url(member, format: :json)
