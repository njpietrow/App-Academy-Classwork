# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  
  User.destroy_all
  # ActiveRecord::Base.connection.reset_pk_sequence!("users")
  user1 = User.create!(email: "user1@email.com")
  user2 = User.create!(email: "22222@fake.com")
  user3 = User.create!(email: "3333@jank.com")

  ShortenedUrl.destroy_all
  # ActiveRecord::Base.connection.reset_pk_sequence!("shortened_urls")
  su1 = ShortenedUrl.shortened_url_factory(user1,"facebook.com")
  su2 = ShortenedUrl.shortened_url_factory(user1,"fakewebsite2.com")
  su3 = ShortenedUrl.shortened_url_factory(user1,"33333.not-here.com")
  su4 = ShortenedUrl.shortened_url_factory(user2,"user2s-first-website.com")

end