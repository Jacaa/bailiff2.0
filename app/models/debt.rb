# frozen_string_literal: true

# :nodoc
class Debt < ApplicationRecord
  belongs_to :debtor,   class_name: 'User', inverse_of: :debts
  belongs_to :creditor, class_name: 'User', inverse_of: :credits

  validates :purpose, presence: true, length: { maximum: 200 }
  validates :amount,  presence: true, numericality: { greater_than: 0 }
  validate  :deadline_is_possible?

  default_scope -> { order(created_at: :desc) }
  scope :covered, -> { where('paid = ?', true) }
  scope :no_covered, -> { where('paid = ?', false) }
  scope :with_debtor, ->(id) { where('debtor_id = ?', id) }
  scope :with_creditor, ->(id) { where('creditor_id = ?', id) }

  private

  def deadline_is_possible?
    return if [date.blank?, deadline.blank?].any?
    errors.add(:deadline, 'must be later than date') if deadline <= date
  end
end
