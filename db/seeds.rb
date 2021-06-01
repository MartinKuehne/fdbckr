# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artwork.delete_all
User.delete_all

u1 = User.create!(
  first_name: "Artist",
  last_name: "1",
  username: "artist1",
  bio: "Hello, I am artist 1. Blah blah blah blah blah blah blah blah blah blah",
  location: "Berlin, DE",
  email: "martin@martin.com",
  password: 'password',
  password_confirmation: 'password'
)

u2 = User.create!(
  first_name: "Artist",
  last_name: "2",
  username: "artist2",
  bio: "Hello, I am artist 2. Blah blah blah blah blah blah blah blah blah blah",
  location: "Berlin, DE",
  email: "yuno@yuno.com",
  password: 'password',
  password_confirmation: 'password'
)

u3 = User.create!(
  first_name: "Artist",
  last_name: "3",
  username: "artist3",
  bio: "Hello, I am artist 3. Blah blah blah blah blah blah blah blah blah blah",
  location: "Berlin, DE",
  email: "marnie@marnie.com",
  password: 'password',
  password_confirmation: 'password'
)

u4 = User.create!(
  first_name: "Artist",
  last_name: "4",
  username: "artist4",
  bio: "Hello, I am artist 4. Blah blah blah blah blah blah blah blah blah blah",
  location: "Berlin, DE",
  email: "laura@laura.com",
  password: 'password',
  password_confirmation: 'password'
)

a1 = Artwork.create!(
  title: "Artwork 1",
  description: "This is a description for Artwork 1",
  privacy: false,
  user: u1
)

a2 = Artwork.create!(
  title: "Artwork 2",
  description: "This is a description for Artwork 2",
  privacy: false,
  user: u2
)

a3 = Artwork.create!(
  title: "Artwork 3",
  description: "This is a description for Artwork 3",
  privacy: false,
  user: u3
)

a4 = Artwork.create!(
  title: "Artwork 4",
  description: "This is a description for Artwork 4",
  privacy: false,
  user: u4
)
