20.times do |n|
  User.create(first_name:            Faker::Name.first_name,
              last_name:             Faker::Name.last_name,
              email:                 Faker::Internet.email,
              password:              'password',
              password_confirmation: 'password',
              image:                 'no-avatar.png')
end

puts 'Users have been created successfully'

5.times do |n|
  Debt.create(creditor_id: User.last.id,
              debtor_id:   (n+1),
              purpose:     Faker::Lorem.sentence,
              amount:      Faker::Number.decimal(2))
end

puts 'Credits have been created'

5.times do |n|
  Debt.create(debtor_id:   User.last.id,
              creditor_id: (n+1),
              purpose:     Faker::Lorem.sentence,
              amount:      Faker::Number.decimal(2))
end

puts 'Debts have been created'