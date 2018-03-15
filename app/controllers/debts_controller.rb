# frozen_string_literal: true

class DebtsController < ApplicationController
  before_action :set_user

  def create
    @debt = Debt.new(debt_params)
    if @debt.save
      redirect_to root_path, notice: 'New loan/debt has been added'
    else
      render 'users/show'
    end
  end

  private

  def debt_params
    params.require(:debt).permit(:purpose, :amount, :date, :deadline)
          .merge(creditor_id: creditor, debtor_id: debtor)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def creditor
    params[:creditor] == 'true' ? @user.id : current_user.id
  end

  def debtor
    params[:creditor] == 'true' ? current_user.id : @user.id
  end
end