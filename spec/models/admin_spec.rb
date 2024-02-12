require 'rails_helper'

RSpec.describe Admin, type: :model do
  it 'is invalid without an email' do
    admin = Admin.new(email: nil)
    expect(admin).to_not be_valid
  end


  it 'is invalid without a gmail/tamu email' do
    admin = Admin.new(email: "test123@email.com")
    expect(admin).to_not be_valid
  end
  # Example test for a custom method

end
