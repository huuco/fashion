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
