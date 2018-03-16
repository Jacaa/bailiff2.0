# frozen_string_literal: true

# :nodoc
class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@bailiff.com'
  layout 'mailer'
end
