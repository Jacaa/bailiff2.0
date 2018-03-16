# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]
  before_action :current_user?

  def index
    query = params[:query]
    page  = params[:page]
    return @users = User.by_full_name(query).page(page) if params[:query]
    @users = User.all.page(params[:page])
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
