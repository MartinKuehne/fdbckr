require 'open-uri'

User.delete_all

u1 = User.create!(email: "marnie@marnie.com", password: 'password', password_confirmation: 'password', created_at: "2011-05-25 12:25:45", updated_at: "2021-05-25 12:28:10", first_name: 'Marnie', last_name: 'The First', username: 'its_lavender_marnie', bio: 'Im an awsome artist', avatar: 'https://source.unsplash.com/X6Uj51n5CE8/300x300', location: 'Berlin')
u2 = User.create!(email: "yuno@yuno.com", password: 'password', password_confirmation: 'password', created_at: "2011-05-25 12:25:45", updated_at: "2021-05-25 12:28:10", first_name: 'Yuno', last_name: 'The Second', username: 'its_yunoTheSecond', bio: 'Im an awsome artist', avatar: 'https://source.unsplash.com/X6Uj51n5CE8/300x300', location: 'Berlin')
u3 = User.create!(email: "laura@laura.com", password: 'password', password_confirmation: 'password', created_at: "2011-05-25 12:25:45", updated_at: "2021-05-25 12:28:10", first_name: 'Laura', last_name: 'The Third', username: 'its_lauraTheThrid', bio: 'I am an artist based in Hamburg and Berlin. I work primarily with lavender and I only collaborate with those that know how to appreciate it. All feedback welcome!', avatar: 'https://source.unsplash.com/X6Uj51n5CE8/300x300', location: 'Berlin')
u4 = User.create!(email: "martin@martin.com", password: 'password', password_confirmation: 'password', created_at: "2011-05-25 12:25:45", updated_at: "2021-05-25 12:28:10", first_name: 'Martin', last_name: 'The Forth', username: 'its_martinTheFourth', bio: 'Im an awsome artist', avatar: 'https://source.unsplash.com/X6Uj51n5CE8/300x300', location: 'Berlin')


=begin
# Cloudinary seeding process if picture already exists
file =
URI.open('https://res.cloudinary.com/dprxpbvxw/image/upload/v1622207721/ti96b6k6argd65nm8ibqu2jqtyuf.jpg')
artwork = Artwork.new(title: sth, etc.)
artwork.photo.attach(io: file, filename: 'sth.png', content_type: 'image/png')
# Here we write article.photo.attach cause we used the has_one_attached :photo relationship in our model
=end

file = URI.open('https://source.unsplash.com/X6Uj51n5CE8/300x300')
u1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')


# u1 = User.create!(
#   first_name: "Artist",
#   last_name: "1",
#   username: "artist1",
#   bio: "Hello, I am artist 1. Blah blah blah blah blah blah blah blah blah blah",
#   location: "Berlin, DE",
#   email: "martin@martin.com",
#   password: 'password',
#   password_confirmation: 'password'
# )

# u2 = User.create!(
#   first_name: "Artist",
#   last_name: "2",
#   username: "artist2",
#   bio: "Hello, I am artist 2. Blah blah blah blah blah blah blah blah blah blah",
#   location: "Berlin, DE",
#   email: "yuno@yuno.com",
#   password: 'password',
#   password_confirmation: 'password'

# )

# u3 = User.create!(
#   first_name: "Artist",
#   last_name: "3",
#   username: "artist3",
#   bio: "Hello, I am artist 3. Blah blah blah blah blah blah blah blah blah blah",
#   location: "Berlin, DE",
#   email: "marnie@marnie.com",
#   password: 'password',
#   password_confirmation: 'password'
# )

# u4 = User.create!(
#   first_name: "Artist",
#   last_name: "4",
#   username: "artist4",
#   bio: "Hello, I am artist 4. Blah blah blah blah blah blah blah blah blah blah",
#   location: "Berlin, DE",
#   email: "laura@laura.com",
#   password: 'password',
#   password_confirmation: 'password'
# )

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

