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
artpiece2 = Artwork.create!(title: "2300", image_url: "fake.url", artist_id: 2)
artpiece3 = Artwork.create!(title: "3", image_url: "fake.url", artist_id: 3)
artpiece4 = Artwork.create!(title: "72", image_url: "fake.url", artist_id: 4)
artpiece5 = Artwork.create!(title: "starry night", image_url: "fake.url", artist_id: 5)
artpiece6 = Artwork.create!(title: "pigs in a blanket", image_url: "fake.url", artist_id: 6)
artpiece7 = Artwork.create!(title: "landscape", image_url: "fake.url", artist_id: 7)
artpiece8 = Artwork.create!(title: "sunny day", image_url: "fake.url", artist_id: 1)