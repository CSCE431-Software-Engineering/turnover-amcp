# frozen_string_literal: true

# spec/models/activity_spec.rb

require 'rails_helper'

RSpec.describe Activity, type: :model do
  subject do
    described_class.new(
      event_name: 'Camp',
      start_time: Time.current,
      end_time: Time.current + 1.hour,
      location: 'Texas A&M',
      description: 'sdfdfl;fjs',
      activity_type: 'Camp',
      points: 10 # Assuming 'points' is a required field
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

  # Removed tests for start_date and end_date

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

  it 'is not valid without points' do
    subject.points = nil
    expect(subject).not_to be_valid
  end
end
