# frozen_string_literal: true

module RequestAuthHelpers
    def authenticate_member
      member = FactoryBot.create(:member) # Ensure you have a factory for the member
      allow_any_instance_of(ApplicationController).to receive(:current_member).and_return(member)
    end
end
