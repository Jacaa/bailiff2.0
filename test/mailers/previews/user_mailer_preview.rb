# frozen_string_literal: true

# :nodoc
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/send_notification
  def send_notification
    user = User.first
    debt = Debt.first
    UserMailer.send_notification(user, debt)
  end
end
