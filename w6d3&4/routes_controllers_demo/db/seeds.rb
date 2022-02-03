# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artwork.destroy_all
User.destroy_all

user1 = User.create!(username: "davinci")
user2 = User.create!(username: "phil")
user3 = User.create!(username: "alex")
user4 = User.create!(username: "mike")
user5 = User.create!(username: "paul")
user6 = User.create!(username: "lizzy")
user7 = User.create!(username: "max")
user8 = User.create!(username: "jill")
user9 = User.create!(username: "bob")

artpiece1 = Artwork.create!(title: "310", image_url: "fake.url", artist_id: 1)
artpiece2 = Artwork.create!(title: "310", image_url: "fake.url", artist_id: 2)
artpiece3 = Artwork.create!(title: "3", image_url: "fake.url", artist_id: 3)
artpiece4 = Artwork.create!(title: "72", image_url: "fake.url", artist_id: 4)
artpiece5 = Artwork.create!(title: "starry night", image_url: "fake.url", artist_id: 5)
artpiece6 = Artwork.create!(title: "pigs in a blanket", image_url: "fake.url", artist_id: 6)
artpiece7 = Artwork.create!(title: "landscape", image_url: "fake.url", artist_id: 7)
artpiece8 = Artwork.create!(title: "sunny day", image_url: "fake.url", artist_id: 1)

share1 = ArtworkShare.create!(artwork_id: 1, viewer_id: 1)
share2 = ArtworkShare.create!(artwork_id: 2, viewer_id: 2)
share3 = ArtworkShare.create!(artwork_id: 3, viewer_id: 3)
share4 = ArtworkShare.create!(artwork_id: 4, viewer_id: 4)
share5 = ArtworkShare.create!(artwork_id: 5, viewer_id: 5)
share6 = ArtworkShare.create!(artwork_id: 6, viewer_id: 6)
share7 = ArtworkShare.create!(artwork_id: 7, viewer_id: 7)
share8 = ArtworkShare.create!(artwork_id: 8, viewer_id: 8)

c1 = Comment.create!(body: "AAAAAAAAA",commenter_id: 1, commented_artwork_id: 2)
c2 = Comment.create!(body: "BBBBBBBBB",commenter_id: 2, commented_artwork_id: 4)
c3 = Comment.create!(body: "CCCCCCCCC",commenter_id: 3, commented_artwork_id: 5)
c4 = Comment.create!(body: "DDDDDDDDD",commenter_id: 4, commented_artwork_id: 3)
c5 = Comment.create!(body: "eeeeeeeeee",commenter_id: 5, commented_artwork_id: 1)
c6 = Comment.create!(body: "ffffffffff",commenter_id: 6, commented_artwork_id: 7)
c7 = Comment.create!(body: "ggggggggggg",commenter_id: 7, commented_artwork_id: 6)
c8 = Comment.create!(body: "hhhhhhhhh",commenter_id: 8, commented_artwork_id: 3)
c9 = Comment.create!(body: "iiiiiiiiiiii",commenter_id: 9, commented_artwork_id: 8)
c10 = Comment.create!(body: "jjjjjjjjjjj",commenter_id: 1, commented_artwork_id: 3)

like1 = Like.create!(user_id: 1, likeable_id: 2, likeable_type: "Artwork")
like2 = Like.create!(user_id: 1, likeable_id: 2, likeable_type: "Comment")
like3 = Like.create!(user_id: 2, likeable_id: 1, likeable_type: "Artwork")
like4 = Like.create!(user_id: 3, likeable_id: 1, likeable_type: "Artwork")
like5 = Like.create!(user_id: 4, likeable_id: 2, likeable_type: "Comment")
like6 = Like.create!(user_id: 5, likeable_id: 3, likeable_type: "Artwork")