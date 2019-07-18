User.create!(name:  "nowik",
             email: "nowik@gmail.com",
             password:              "qwerty",
             password_confirmation: "qwerty",
             role: "admin")

User.create!(name:  "łukasz",
             email: "łukasz@gmail.com",
             password:              "qwerty",
             password_confirmation: "qwerty",
             role: "mod")

User.create!(name:  "zachary",
             email: "zachary@gmail.com",
             password:              "qwerty",
             password_confirmation: "qwerty")

users = User.order(:created_at).take(2)
50.times do
  title = Faker::Lorem.sentence(8)
  subtitle = Faker::Lorem.sentence(30)
  body = Faker::Lorem.sentence(200)
  users.each { |user| user.posts.create!(title: title, subtitle: subtitle, body: body) }
end

posts = Post.order(:created_at).take(5)
5.times do
  body = Faker::Lorem.sentence(40)
  posts.each { |post| post.comments.create!(body: body, published: true, user_id: 1) }
end

5.times do
  body = Faker::Lorem.sentence(40)
  posts.each { |post| post.comments.create!(body: body, published: true, user_id: 2) }
end

5.times do
  body = Faker::Lorem.sentence(40)
  posts.each { |post| post.comments.create!(body: body, published: true, user_id: 3) }
end
