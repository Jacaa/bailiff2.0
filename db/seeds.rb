20.times do |n|
  User.create(first_name:            Faker::Name.first_name,
              last_name:             Faker::Name.last_name,
              email:                 Faker::Internet.email,
              password:              'password',
              password_confirmation: 'password',
              image:                 'no-avatar.png')
end

puts 'Users have been created successfully'