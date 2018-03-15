10.times do |n|
  User.create(first_name:            Faker::Name.first_name,
              last_name:             Faker::Name.last_name,
              email:                 Faker::Internet.email,
              password:              'password',
              password_confirmation: 'password',
              image:                 'no-avatar.png')
end

User.create(first_name:            'Jacek',
            last_name:             'Mikolajczak',
            email:                 'user@user.com',
            password:              'qwerty',
            password_confirmation: 'qwerty',
            image:                 'no-avatar.png')

puts 'Users have been created successfully'

3.times do |n|
  Debt.create(creditor_id: User.last.id,
              debtor_id:   (n+1),
              purpose:     Faker::Lorem.sentence,
              amount:      Faker::Number.decimal(2),
              paid:        false)
end

puts 'Credits have been created'

2.times do |n|
  Debt.create(creditor_id: User.last.id,
              debtor_id:   (n+1),
              purpose:     Faker::Lorem.sentence,
              amount:      Faker::Number.decimal(2),
              paid:        true)
end

puts 'Covered credits have been created'

2.times do |n|
  Debt.create(creditor_id: (n+1),
              debtor_id:   User.last.id,
              purpose:     Faker::Lorem.sentence,
              amount:      Faker::Number.decimal(2),
              paid:        true)
end

puts 'Covered debts have been created'

2.times do |n|
  Debt.create(debtor_id:   User.last.id,
              creditor_id: (n+1),
              purpose:     Faker::Lorem.sentence,
              amount:      Faker::Number.decimal(2),
              paid:        false)
end

puts 'Debts have been created'