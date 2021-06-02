# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
  description: "This is Artwork 1 and it is PRIVATE. Only Yuno should be seeing this.",
  privacy: true,
  user: u1
)

a2 = Artwork.create!(
  title: "Artwork 2",
  description: "This is Artwork 2 and it is PUBLIC. Yuno has been invited to see this.",
  privacy: false,
  user: u2
)

a3 = Artwork.create!(
  title: "Artwork 3",
  description: "This is Artwork 3 and it is PUBLIC.",
  privacy: false,
  user: u3
)

a4 = Artwork.create!(
  title: "Artwork 4",
  description: "This is Artwork 4 and it is PUBLIC. Yuno should not be seeing this.",
  privacy: true,
  user: u4
)

feedback = FeedbackRequest.new
feedback.user = u2
feedback.artwork = a1
feedback.save!

feedback = FeedbackRequest.new
feedback.user = u2
feedback.artwork = a2
feedback.save!
