# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
today = DateTime.now.to_date

user = User.find_by(email: "ik@bramjans.com")
user = user || User.create(email: "ik@bramjans.com", username: "bram", password: "123456", password_confirmation: "123456")

counter = 0

title_lamb = lambda do
  counter += 1
  "#{counter} - #{Faker::Lorem.sentence}"
end

code_lamb = lambda do
  code_snippit = <<-CODE
class Post < ActiveRecord::Base
  # Starting from 0
  enum status: [:draft, :released, :deleted]

  belongs_to :user

  scope :draft, -> { where(status: 0) }
  scope :released, -> { where(status: 1) }
  scope :deleted, -> { where(status: 2) }
end
CODE

  "<pre><code class=\"ruby\">#{code_snippit}</code></pre>"
end

body_lamb = lambda do
  body_arr = Faker::Lorem.paragraphs(rand(20))
  body_arr += Array.new(rand(5)) { code_lamb.call }
  body_arr.shuffle.map { |p| "<p>#{p}</p>" }.join
end

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
