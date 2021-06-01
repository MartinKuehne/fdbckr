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
