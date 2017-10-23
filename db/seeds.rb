# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

15.times do
    User.create!(
        email: Faker::Internet.email,
        password: Faker::Internet.password(8)
    )
end

admin = User.create!(
    email:    'admin@bloc.com',
    password: 'password',
    password_confirmation: 'password',
    role:     'admin'
)

premium = User.create!(
    email:    'premium@bloc.com',
    password: 'password',
    password_confirmation: 'password',
    role:     'premium'
)

standard = User.create!(
    email:    'standard@example.com',
    password: 'password',
    password_confirmation: 'password',
    role:     'standard'
)
users = User.all

50.times do
    Wiki.create!(
        title: Faker::LeagueOfLegends.quote,
        body: Faker::MostInterestingManInTheWorld.quote,
        private: false,
        user: users.sample
    )
end

wikis = Wiki.all

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Wiki.count} posts created"