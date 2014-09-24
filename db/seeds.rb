# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

puts 'creating seed projects'

CSV.foreach(File.join(Rails.root, 'public', 'res', 'seed.csv'), headers: true) do |project|
  Project.create(name: project['Name'], description: project['Description'])
end

puts 'creation process has been finished'