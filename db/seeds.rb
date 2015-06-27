# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  busarray = []

# Load routes from the API
  routes = HTTParty.get("http://api.metro.net/agencies/lametro/routes/")

  routes["items"].each do |r|


    if r["id"] != "704"
      #  && r["id"] != "733" && r["id"] != "734"
        next
    end
    # Create the route
      route = Route.find_or_create_by(api_id: r["id"]) do |row|

              row.name = r["display_name"]
      end

      # Load the vehicles for the route
      buses = HTTParty.get("http://api.metro.net/agencies/lametro/routes/" + r["id"] + "/vehicles/")

        buses["items"].each do |b|
          if b["run_id"].split("_").last == "0"
            # Create the bus
            bus = Bus.find_or_create_by(api_id: b["id"]) do |row|
                row.name = b["id"]
                row.route_id = route.id
                row.latitude = b["latitude"]
                row.longitude = b["longitude"]
                busarray.push(row["api_id"])
            end


            puts busarray.count
          end
        # busarray.each do |array|
        #
        #   puts array
        #
        # end

        end if buses["items"]

      # Load the stops for the route
      i = 0
      stops = HTTParty.get("http://api.metro.net/agencies/lametro/routes/" + r["id"] + "/sequence/")
      stop29 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/29/predictions/")
      stop4096 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/4096/predictions/")
      stop14360 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14360/predictions/")

      stops["items"].each do |s|
        # stopABC = HTTParty.get("http://api.metro.net/agencies/lametro/stops/#{s["id"]}/predictions/")

        # Create the stop
          stop = Stop.find_or_create_by(api_id: s["id"]) do |row|
              # puts stop29["items"][0]["seconds"]
              row.name = s["display_name"]
              row.latitude = s["latitude"]
              row.longitude = s["longitude"]

              # puts s["id"]
              # puts HTTParty.get("http://api.metro.net/agencies/lametro/stops/#{s["id"]}/predictions/")["items"][0]["seconds"]

              # puts stop29["items"][0]["seconds"]
              # row.seconds = stop29["items"][0]["seconds"]


              # puts HTTParty.get("http://api.metro.net/agencies/lametro/stops/#{s["id"]}/predictions/")["items"][0]["seconds"]
              # abc = HTTParty.get("http://api.metro.net/agencies/lametro/stops/#{s["id"]}/predictions/")["items"][0]["seconds"]
              # row.seconds = 123
              # row.seconds = abc["seconds"]

          end

          if stop["api_id"] == 29
            stop.update_attributes(
              :seconds => stop29["items"][0]["seconds"]
            )

          elsif stop["api_id"] == 4096
            stop.update_attributes(
              :seconds => stop4096["items"][0]["seconds"]
            )
          elsif stop["api_id"] == 14360
            stop.update_attributes(
              :seconds => stop14360["items"][0]["seconds"]
            )
          end



        # end
        # Create the route stop
        route_stop = RouteStop.create(route_id: route.id, stop_id: stop.id, order: i += 1)

        route.buses.each do |bus|

            # Link the buses to the route stop
            StopTime.create(bus_id: bus.id, route_stop_id: route_stop.id)

        end
      # end

      end if stops["items"]



  end
