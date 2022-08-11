
50.times do |n|
  name      = Faker::Name.first_name
  email     = Faker::Internet.free_email name: name
  password  = Faker::Internet.password min_length: 6
  user = User.create!( name:                  name,
                       email:                 email,
                       password:              password,
                       password_confirmation: password )
  EmailActivation.create!( user_id: user.id, 
                           activation_digest: Faker::Internet.device_token )
end
name      = Faker::Name.first_name
email     = Faker::Internet.free_email name: name
password  = Faker::Internet.password min_length: 6
user = User.create!( name:                  name,
                     email:                 email,
                     password:              password,
                     password_confirmation: password )
user
EmailActivation.create!( user_id: user.id, 
                         activation_digest: Faker::Internet.device_token )

User.create!(
  name: "Andrey",
  email: "shevchenko@mail.com",
  password: "passwd",
  password_confirmation: "passwd")