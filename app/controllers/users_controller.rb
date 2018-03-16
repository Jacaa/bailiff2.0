# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :current_user?

  def index
    @users = User.all
  end

  def show
    @debt            = Debt.new
    @dashboard       = DashboardViewObject.new(@user)
    @debts_history   = @user.debts.covered if current_user?
    @credits_history = @user.credits.covered if current_user?
  end

  private

  def current_user?
    @user == current_user
  end

  def set_user
    @user = User.find(params[:id])
  end
end
