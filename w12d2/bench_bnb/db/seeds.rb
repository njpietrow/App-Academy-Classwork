# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Bench.destroy_all

User.create(username: "test", password: "password")
User.create(username: "hello", password: "password")

Bench.create(description: "bench 1", lat: 34.038837, lng: -118.453831)
Bench.create(description: "bench 2", lat: 34.036053, lng: -118.479399)

