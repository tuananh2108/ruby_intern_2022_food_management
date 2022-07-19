User.create!(name: "Admin",
             email: "admin@food.com",
             password: "123456",
             password_confirmation: "123456",
             admin: true)

10.times do |n|
  name = "User #{n+1}"
  email = "user#{n+1}@food.com"
  password = "123456"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
