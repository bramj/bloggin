# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
today = DateTime.now.to_date

user = User.create(email: "ik@bramjans.com", username: "bram", password: "123456", password_confirmation: "123456")

counter = 0

title_lamb = lambda do
  counter += 1
  "#{counter} - #{Faker::Lorem.sentence}"
end

body_lamb = lambda { Faker::Lorem.paragraphs(rand(20)).map { |p| "<p>#{p}</p>" }.join }

# Old posts
5.times do
  title = title_lamb.call
  user.posts << Post.create(title: title, body: body_lamb.call, release_at: today - 30, released_at: today - 30, status: 1)
  puts "Created old post '#{title}'"
end

# Pipeline posts
3.times do
  title = title_lamb.call
  user.posts << Post.create(title: title, body: body_lamb.call, release_at: today + 30)
  puts "Created pipelined post '#{title}'"
end
