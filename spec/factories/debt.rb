# frozen_string_literal: true

FactoryBot.define do
  factory :debt do
    debtor_id   1
    creditor_id 2
    amount      2.00
    purpose     'For a snack'
    date        { Time.zone.now }
    deadline    { Time.zone.now + 10 }
    paid        false
  end
end
