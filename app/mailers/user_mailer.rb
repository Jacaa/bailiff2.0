# frozen_string_literal: true

# :nodoc
class UserMailer < ApplicationMailer
  def send_notification(user, debt)
    @user = user
    @debt = debt
    mail to: user.email, subject: 'Debt covered'
  end
end
