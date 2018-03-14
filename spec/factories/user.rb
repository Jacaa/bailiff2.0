# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name            'Jacek'
    last_name             'Mikolajczak'
    email                 'example@example.com'
    password              'password'
    password_confirmation 'password'
    image                 'user-avatar.png'
  end
end
