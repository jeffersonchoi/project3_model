# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Route.create([
  {name: "Route 1"},
  {name: "Route 2"},
  {name: "Route 3"},
  {name: "Route 4"}
  ])

Bus.create([
  {name: "Bus 1"},
  {name: "Bus 2"},
  {name: "Bus 3"},
  {name: "Bus 4"}
  ])


Bus.all.each do |bus|

  Route.all.sample(2).each do |route|
    route.buses << bus

  end


end
