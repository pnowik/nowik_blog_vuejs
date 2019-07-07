User.create!(name:  "nowik",
             email: "pnowik97@gmail.com",
             password:              "qwerty",
             password_confirmation: "qwerty",
             admin: true)

users = User.order(:created_at).take(1)
50.times do
  title = Faker::Lorem.sentence(5)
  subtitle = Faker::Lorem.sentence(30)
  body = Faker::Lorem.sentence(100)
  users.each { |user| user.posts.create!(title: title, subtitle: subtitle, body: body) }
end
