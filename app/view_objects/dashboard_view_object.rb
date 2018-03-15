# frozen_string_literal: true

# :nodoc
class DashboardViewObject
  def initialize(user)
    @user = user
  end

  def user_debts
    @user.debts.no_covered.each_with_object({}) do |debt, hsh|
      hsh[debt.id] = { debt: debt,
                       creditor: User.find(debt.creditor_id) }
    end
  end

  def user_credits
    @user.credits.no_covered.each_with_object({}) do |credit, hsh|
      hsh[credit.id] = { credit: credit,
                         debtor: User.find(credit.debtor_id) }
    end
  end
end
