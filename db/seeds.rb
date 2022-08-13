
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
#======== User record with known password =========#
User.create!(
  name: "Andrey",
  email: "shevchenko@mail.com",
  password: "passwd",
  password_confirmation: "passwd")

#======== Admin record ==============#
admin = User.create!(
  name: "Admin",
  email: "administrator@mail.com",
  password: "adminpass",
  password_confirmation: "adminpass")

Admin.create!(user_id: admin.id, is_admin: true)
