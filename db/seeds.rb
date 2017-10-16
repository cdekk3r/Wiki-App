# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

50.times do
    Wiki.create!(
        title: Faker::LeagueOfLegends.quote,
        body: Faker::MostInterestingManInTheWorld.quote,
        private: false
    )
end

wikis = Wiki.all

15.times do
    User.create!(
        email: Faker::Internet.email,
        password: Faker::Internet.password(6)
    )
end

users = User.all

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Wiki.count} posts created"