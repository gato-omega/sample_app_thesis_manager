# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

puts 'creating users'

users = []
common_password = '123456'

['johan.tique@codescrum.com', 'miguel.diaz@codescrum.com', 'jairo.diaz@codescrum.com', 'jp.amaya@codescrum.com', 'diego.gomez@codescrum.com'].each do |email|
  users << User.create(email: email, password: common_password, password_confirmation: common_password)
end

puts 'creating seed projects'

CSV.foreach(File.join(Rails.root, 'public', 'res', 'seed.csv'), headers: true) do |project|
  user = users.sample
  user.projects.create(name: project['Name'], description: project['Description'])
end

puts 'seeding process has been finished'