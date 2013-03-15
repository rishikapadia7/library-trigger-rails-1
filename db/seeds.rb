# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:email => 'aldrin.almacin@mosaic.com', :password => 'm')

100.times do | n |
  book = Book.create(:title => Faker::Lorem.words.join(' '), :author => Faker::Name.name)
  patron = Patron.create(:first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name)

  if rand(2) == 0
    checkin_date = Time.now
    book.update_attributes(:checked_out => false)
  else
    checkin_date = nil
    book.update_attributes(:checked_out => true)
  end

  Transaction.create(:patron_id => patron.id, :book_id => book.id, :checkout_date => Time.now, :checkin_date => checkin_date)
end
