# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

=begin 
# Cloudinary seeding process if picture already exists
file =
URI.open('https://res.cloudinary.com/dprxpbvxw/image/upload/v1622207721/ti96b6k6argd65nm8ibqu2jqtyuf.jpg')
artwork = Artwork.new(title: sth, etc.) 
artwork.photo.attach(io: file, filename: 'sth.png', content_type: 'image/png')
# Here we write article.photo.attach cause we used the has_one_attached :photo relationship in our model
=end

# User.delete_all
# Comment.delete_all

# u1 = User.create!(email: "marnie@marnie.com", password: 'password', password_confirmation: 'password', created_at: "2011-05-25 12:25:45", updated_at: "2021-05-25 12:28:10", first_name: 'Marnie', last_name: 'The First', username: 'Marnie', bio: 'Im an awsome artist', avatar: 'https://source.unsplash.com/X6Uj51n5CE8/300x300', location: 'Berlin')
# u2 = User.create!(email: "yuno@yuno.com", password: 'password', password_confirmation: 'password', created_at: "2011-05-25 12:25:45", updated_at: "2021-05-25 12:28:10", first_name: 'Yuno', last_name: 'The Second', username: 'Yuno', bio: 'Im an awsome artist', avatar: 'https://source.unsplash.com/X6Uj51n5CE8/300x300', location: 'Berlin')
# u3 = User.create!(email: "laura@laura.com", password: 'password', password_confirmation: 'password', created_at: "2011-05-25 12:25:45", updated_at: "2021-05-25 12:28:10", first_name: 'Laura', last_name: 'The Third', username: 'Laura', bio: 'Im an awsome artist', avatar: 'https://source.unsplash.com/X6Uj51n5CE8/300x300', location: 'Berlin')
# u4 = User.create!(email: "martin@martin.com", password: 'password', password_confirmation: 'password', created_at: "2011-05-25 12:25:45", updated_at: "2021-05-25 12:28:10", first_name: 'Martin', last_name: 'The Forth', username: 'Martin', bio: 'Im an awsome artist', avatar: 'https://source.unsplash.com/X6Uj51n5CE8/300x300', location: 'Berlin')

Comment.create(content:'Loving it', user_id: 1, artwork_id: 1, x_offset: 20, y_offset: 100)
Comment.create(content:'Loving it', user_id: 2, artwork_id: 1, x_offset: 200, y_offset: 200)
Comment.create(content:'Loving it', user_id: 3, artwork_id: 1, x_offset: 50, y_offset: 350)
Comment.create(content:'Loving it', user_id: 4, artwork_id: 1, x_offset: 80, y_offset: 400)
Comment.create(content:'Loving it', user_id: 1, artwork_id: 1, x_offset: 100, y_offset: 80)
Comment.create(content:'Loving it', user_id: 2, artwork_id: 1, x_offset: 20, y_offset: 150)