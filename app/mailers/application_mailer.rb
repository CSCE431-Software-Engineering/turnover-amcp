# frozen_string_literal: true

# ApplicationMailer serves as the base class for all mailers in the application.
# It inherits from ActionMailer::Base, enabling the application to send emails.
# This class sets global defaults that can be overridden by subclasses to define
# specific behavior for different types of emails. The default sender email address
# is specified here, and a layout ('mailer') is applied to all emails sent by
# mailers inheriting from ApplicationMailer, ensuring a consistent email format.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
