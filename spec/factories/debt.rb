# frozen_string_literal: true

FactoryBot.define do
  factory :debt do
    amount      2.00
    purpose     'For a snack'
    date        { Time.zone.now }
    deadline    { Time.zone.now + 10 }
  end
end
