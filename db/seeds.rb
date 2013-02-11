# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:email => 'aldrin.almacin@mosaic.com', :password => 'm')

1000.times do | n |
  Book.create(:title => Faker::Lorem.words.join(' '), :author => Faker::Name.name)
end

1000.times do | n |
  Patron.create(:first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name)
end
