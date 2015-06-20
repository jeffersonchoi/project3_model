# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Load routes from the API
routes = HTTParty.get("http://api.metro.net/agencies/lametro/routes/")
routes["items"].each do |r|

    # Create the route
    route = Route.create(name: r["display_name"])

    # Load the vehicles for the route
    buses = HTTParty.get("http://api.metro.net/agencies/lametro/routes/" + r["id"] + "/vehicles/")
    buses["items"].each do |b|

        # Create the bus
        bus = Bus.create(name: b["id"], route_id: route.id, latitude: b["latitude"], longitude: b["longitude"])

    end if buses["items"]

    # Load the stops for the route
    i = 0
    stops = HTTParty.get("http://api.metro.net/agencies/lametro/routes/" + r["id"] + "/stops/")
    stops["items"].each do |s|

      # Create the stop
      stop = Stop.create(name: s["display_name"], latitude: s["latitude"], longitude: s["longitude"])

      # Create the route stop
      route_stop = RouteStop.create(route_id: route.id, stop_id: stop.id, order: i += 1)

      route.buses.each do |bus|

          # Link the buses to the route stop
          StopTime.create(bus_id: bus.id, route_stop_id: route_stop.id)

      end

    end if stops["items"]

end
