# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @dashboard = DashboardViewObject.new(current_user)
  end
end
