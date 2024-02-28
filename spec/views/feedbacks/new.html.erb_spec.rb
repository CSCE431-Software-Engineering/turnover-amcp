# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'feedbacks/new', type: :view do
  before(:each) do
    assign(:feedback, Feedback.new(
                        feedback: 'MyString',
                        email: 'MyString',
                        name: 'MyString'
                      ))
  end

  it 'renders new feedback form' do
    render

    assert_select 'form[action=?][method=?]', feedbacks_path, 'post' do
      assert_select 'input[name=?]', 'feedback[feedback]'

      assert_select 'input[name=?]', 'feedback[email]'

      assert_select 'input[name=?]', 'feedback[name]'
    end
  end
end
