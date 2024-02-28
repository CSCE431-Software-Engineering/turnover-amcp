# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'feedbacks/show', type: :view do
  before(:each) do
    assign(:feedback, Feedback.create!(
                        feedback: 'Feedback',
                        email: 'Email',
                        name: 'Name'
                      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Feedback/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Name/)
  end
end
