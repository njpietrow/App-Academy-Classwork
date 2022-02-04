# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
cat1 = Cat.create!(name: 'kitty', sex: 'F', birth_date: '2015/01/20', color: 'tuxedo', description: 'A very nice kitty!')
cat2 = Cat.create!(name: 'paul', sex: 'F', birth_date: '2011/01/20', color: 'orange', description: 'A very, very nice kitty!')
cat3 = Cat.create!(name: 'fred', sex: 'M', birth_date: '2015/07/20', color: 'black', description: 'A very nice kitty!')

