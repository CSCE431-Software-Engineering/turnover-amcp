# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'feedbacks/index', type: :view do
  include Devise::Test::ControllerHelpers
  before(:each) do
    admin = double('Member', is_admin?: true)
    allow(view).to receive(:current_member).and_return(admin)
    assign(:feedbacks, [
             Feedback.create!(
               feedback: 'Feedback',
               email: 'Email',
               name: 'Name'
             ),
             Feedback.create!(
               feedback: 'Feedback',
               email: 'Email',
               name: 'Name'
             )
           ])
  end

  it 'renders a list of feedbacks' do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new('Feedback'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Email'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
  end
end
