# frozen_string_literal: true

module ApplicationHelper
  def not_current_user(user)
    user != current_user
  end
end
