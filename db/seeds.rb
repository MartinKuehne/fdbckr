require 'open-uri'
Friendship.delete_all
User.delete_all

u1 = User.create!(email: "marnie@marnie.com", password: 'password', password_confirmation: 'password', created_at: "2011-05-25 12:25:45", updated_at: "2021-05-25 12:28:10", first_name: 'Marnie', last_name: 'The First', username: 'its_lavender_marnie', bio: 'Im an awsome artist', avatar: 'https://source.unsplash.com/X6Uj51n5CE8/300x300', location: 'Berlin')
u2 = User.create!(email: "yuno@yuno.com", password: 'password', password_confirmation: 'password', created_at: "2011-05-25 12:25:45", updated_at: "2021-05-25 12:28:10", first_name: 'Yuno', last_name: 'The Second', username: 'its_yunoTheSecond', bio: 'Im an awsome artist', avatar: 'https://source.unsplash.com/X6Uj51n5CE8/300x300', location: 'Berlin')
u3 = User.create!(email: "laura@laura.com", password: 'password', password_confirmation: 'password', created_at: "2011-05-25 12:25:45", updated_at: "2021-05-25 12:28:10", first_name: 'Laura', last_name: 'The Third', username: 'its_lauraTheThrid', bio: 'I am an artist based in Hamburg and Berlin. I work primarily with lavender and I only collaborate with those that know how to appreciate it. All feedback welcome!', avatar: 'https://source.unsplash.com/X6Uj51n5CE8/300x300', location: 'Berlin')
u4 = User.create!(email: "martin@martin.com", password: 'password', password_confirmation: 'password', created_at: "2011-05-25 12:25:45", updated_at: "2021-05-25 12:28:10", first_name: 'Martin', last_name: 'The Forth', username: 'its_martinTheFourth', bio: 'Im an awsome artist', avatar: 'https://source.unsplash.com/X6Uj51n5CE8/300x300', location: 'Berlin')

fs1 = Friendship.create!(status: "accepted", asker_id: u1.id, receiver_id: u2.id)
fs2 = Friendship.create!(status: "accepted", asker_id: u1.id, receiver_id: u3.id)
fs3 = Friendship.create!(status: "accepted", asker_id: u4.id, receiver_id: u1.id)

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
