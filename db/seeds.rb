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

3.times do |n|
  name = "Category #{n+1}"
  Category.create!(name: name)
end

10.times do |n|
  name = "Product #{n+1}"
  # image = "image#{n+1}.img"
  # image= File.read("/images/food.jpeg")
  description = "Description #{n+1}"
  Product.create!(name: name,
                  description: description,
                  unit_price: 50000,
                  category: Category.first)
end
