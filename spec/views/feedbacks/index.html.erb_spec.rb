# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'feedbacks/index', type: :view do
  before(:each) do
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
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Feedback'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Email'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
  end
end
