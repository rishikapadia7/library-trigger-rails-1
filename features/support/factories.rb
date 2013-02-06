FactoryGirl.define do
  factory :book do |b|
    b.title Faker::Lorem.word
    b.author Faker::Name.name
  end

  factory :patron do |p|
    p.first_name Faker::Name.first_name
    p.last_name Faker::Name.last_name
  end
end
