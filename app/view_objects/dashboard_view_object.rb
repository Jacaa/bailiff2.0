# frozen_string_literal: true

# :nodoc
class DashboardViewObject
  def initialize(user)
    @user = user
  end

  def user_active_debts
    @user.debts.no_covered.each_with_object({}) do |debt, hsh|
      hsh[debt.id] = { debt: debt,
                       creditor: User.find(debt.creditor_id) }
    end
  end

  def user_active_credits
    @user.credits.no_covered.each_with_object({}) do |credit, hsh|
      hsh[credit.id] = { credit: credit,
                         debtor: User.find(credit.debtor_id) }
    end
  end

  def user_historical_debts
    @user.debts.covered.each_with_object({}) do |debt, hsh|
      hsh[debt.id] = { debt: debt,
                       creditor: User.find(debt.creditor_id) }
    end
  end

  def user_historical_credits
    @user.credits.covered.each_with_object({}) do |credit, hsh|
      hsh[credit.id] = { credit: credit,
                         debtor: User.find(credit.debtor_id) }
    end
  end
end
