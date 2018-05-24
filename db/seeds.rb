10.times do |n|
  full_name = "user"+n.to_s
  username = "user"+n.to_s
  email = "user"+n.to_s+"@gmail.com"
  password = "123456"
  User.create! full_name: full_name,
    username: username,
    email: email,
    password: "123456",
    password_confirmation: "123456",
    role: 0,
    active: Time.zone.now
end

20.times do |n|
  Address.create! alias: "my address"+n.to_s,
    full_name: Faker::Name.name,
    post_code: Faker::Address.postcode,
    city: Faker::Address.city,
    country: Faker::Address.country,
    phone: Faker::PhoneNumber.phone_number,
    user_id: rand(0..10)
end
