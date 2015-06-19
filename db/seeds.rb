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

Stop.create([
  {name: "Stop 1"},
  {name: "Stop 2"},
  {name: "Stop 3"},
  {name: "Stop 4"},
  {name: "Stop 5"},
  {name: "Stop 6"},
  {name: "Stop 7"},
  {name: "Stop 8"}
  ])

Bus.all.each do |bus|

  Route.all.sample(2).each do |route|
    route.buses << bus

  end


end


Route.all.each do |route|

  Stop.all.sample(6).each do |stop|

    RouteStop.create(route_id: route.id, stop_id: stop.id)


  end

end
