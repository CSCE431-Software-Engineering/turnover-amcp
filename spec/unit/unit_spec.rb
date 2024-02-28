# spec/models/activity_spec.rb

require 'rails_helper'

RSpec.describe Activity, type: :model do
  subject do
    described_class.new(
      event_name: 'Camp',
      start_time: Time.current,
      end_time: Time.current + 1.hour,
      start_date: Date.today,
      end_date: Date.today + 1.day,
      location: 'Texas A&M',
      description: 'sdfdfl;fjs',
      activity_type: 'Camp'
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an event name' do
    subject.event_name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a start time' do
    subject.start_time = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an end time' do
    subject.end_time = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a start date' do
    subject.start_date = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an end date' do
    subject.end_date = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a location' do
    subject.location = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an activity type' do
    subject.activity_type = nil
    expect(subject).not_to be_valid
  end
end


