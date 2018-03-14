# frozen_string_literal: true

# :nodoc
class Debt < ApplicationRecord
  belongs_to :debtor,   class_name: 'User', inverse_of: :debts
  belongs_to :creditor, class_name: 'User', inverse_of: :credits

  validates :amount,  presence: true, numericality: { greater_than: 0 }
  validates :purpose, presence: true, length: { maximum: 200 }
  validate  :deadline_is_possible?

  private

  def deadline_is_possible?
    return if [date.blank?, deadline.blank?].any?
    errors.add(:deadline, 'must be later than date') if deadline <= date
  end
end
