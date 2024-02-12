require 'rails_helper'

RSpec.describe "Homes", type: :request do
  include Devise::Test::IntegrationHelpers
  before do
    admin = FactoryBot.create(:admin) # Adjust as needed
    sign_in admin
  end

  describe "GET root" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
  
end
