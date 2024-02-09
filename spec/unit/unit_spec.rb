# location: spec/unit/unit_spec.rb
require 'rails_helper'

# Example Test

# RSpec.describe Book, type: :model do
#   subject do
#     described_class.new(title: 'harry potter')
#   end

#   it 'is valid with valid attributes' do
#     expect(subject).to be_valid
#   end

#   it 'is not valid without a name' do
#     subject.title = nil
#     expect(subject).not_to be_valid
#   end
# end

RSpec.describe Feedback, type: :model do
  subject do
    described_class.new(feedback: 'Idk what to say anymore.')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without feedback' do
    subject.feedback = nil
    expect(subject).not_to be_valid
  end
end
