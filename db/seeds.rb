# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(name: "Le Quoc Thinh",
email: "quocthinhbku@gmail.com",
password: "Quocthinh1511@",
password_confirmation: "Quocthinh1511@",
admin: true,activated: true,
activated_at: Time.zone.now,
role: 1) 
# Generate a bunch of additional users.
99.times do |n|
name = "Others"
email = "example-#{n+1}@railstutorial.org"
password = "password"
role =0
User.create!(name: name,
email: email,
password: password,
password_confirmation: password)
end
users = User.order(:created_at).take(90)
50.times do 
content = "Hello everyone"
users.each { |user| user.microposts.create!(content: content) }
end
Category.create(name: 'Seft-help')
Category.create(name: 'Comic Book or Graphic Novel')
Category.create(name: 'Historical Fiction')
Category.create(name: 'Classics')
Category.create(name: 'Literary Fiction')
Category.create(name: 'Horror')

