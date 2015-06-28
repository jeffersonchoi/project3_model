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
          if b["run_id"]
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
      stop6001 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/6001/predictions/")
      stop5977 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/5977/predictions/")
      stop5979 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/5979/predictions/")
      stop6041 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/6041/predictions/")
      stop6039 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/6039/predictions/")
      stop14424 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14424/predictions/")
      stop6058 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/6058/predictions/")
      stop6040 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/6040/predictions/")
      stop5917 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/5917/predictions/")
      stop6050 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/6050/predictions/")
      stop6008 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/6008/predictions/")
      stop14378 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14378/predictions/")
      stop7946 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/7946/predictions/")
      stop6031 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/6031/predictions/")
      stop6014 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/6014/predictions/")
      stop6052 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/6052/predictions/")
      stop6023 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/6023/predictions/")
      stop6019 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/6019/predictions/")
      stop5386 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/5386/predictions/")
      stop14436 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14436/predictions/")
      stop5387 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/5387/predictions/")
      stop6033 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/6033/predictions/")
      stop1443 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/1443/predictions/")
      stop17306 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/17306/predictions/")
      stop5400 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/5400/predictions/")
      stop8011 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/8011/predictions/")
      stop2421 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/2421/predictions/")
      stop8040 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/8040/predictions/")
      stop668 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/668/predictions/")
      stop660 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/660/predictions/")




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

          case stop["api_id"]

          when 29

            if stop29["items"][0]["run_id"].split("_").first == "704" &&  stop29["items"][0]["run_id"].split("_").last == "0"
              puts stop29["items"][0]["seconds"]
            end
            stop.update_attributes(
              :seconds => stop29["items"][0]["seconds"]
            )

          when 4096

            if stop4096["items"][0]["run_id"].split("_").first == "704" &&      stop4096["items"][0]["run_id"].split("_").last == "0"
              puts stop4096["items"][0]["seconds"]
            end

            stop.update_attributes(
              :seconds => stop4096["items"][0]["seconds"]
            )
          when 14360
            stop.update_attributes(
              :seconds => stop14360["items"][0]["seconds"]
            )
          when 6001
            stop.update_attributes(
              :seconds => stop6001["items"][0]["seconds"]
            )
          when 5977
            stop.update_attributes(
              :seconds => stop5977["items"][0]["seconds"]
            )
          when 5979
            stop.update_attributes(
              :seconds => stop5979["items"][0]["seconds"]
            )
          when 6041
            stop.update_attributes(
              :seconds => stop6041["items"][0]["seconds"]
            )
          when 6039
            stop.update_attributes(
              :seconds => stop6039["items"][0]["seconds"]
            )
          when 14424
            stop.update_attributes(
              :seconds => stop14424["items"][0]["seconds"]
            )
          when 6058
            stop.update_attributes(
              :seconds => stop6058["items"][0]["seconds"]
            )
          when 6040
            stop.update_attributes(
              :seconds => stop6040["items"][0]["seconds"]
            )
          when 5917
            stop.update_attributes(
              :seconds => stop5917["items"][0]["seconds"]
            )
          when 6050
            stop.update_attributes(
              :seconds => stop6050["items"][0]["seconds"]
            )
          when 6008
            stop.update_attributes(
              :seconds => stop6008["items"][0]["seconds"]
            )
          when 14378
            stop.update_attributes(
              :seconds => stop14378["items"][0]["seconds"]
            )
          when 7946
            stop.update_attributes(
              :seconds => stop7946["items"][0]["seconds"]
            )
          when 6031
            stop.update_attributes(
              :seconds => stop6031["items"][0]["seconds"]
            )
          when 6014
            stop.update_attributes(
              :seconds => stop6014["items"][0]["seconds"]
            )
          when 6052
            stop.update_attributes(
              :seconds => stop6052["items"][0]["seconds"]
            )
          when 6023
            stop.update_attributes(
              :seconds => stop6023["items"][0]["seconds"]
            )
          when 6019
            stop.update_attributes(
              :seconds => stop6019["items"][0]["seconds"]
            )
          when 5386
            stop.update_attributes(
              :seconds => stop5386["items"][0]["seconds"]
            )
          when 14436
            stop.update_attributes(
              :seconds => stop14436["items"][0]["seconds"]
            )
          when 5387
            stop.update_attributes(
              :seconds => stop5387["items"][0]["seconds"]
            )
          when 6033
            stop.update_attributes(
              :seconds => stop6033["items"][0]["seconds"]
            )
          when 1443
            stop.update_attributes(
              :seconds => stop1443["items"][0]["seconds"]
            )
          when 17306
            stop.update_attributes(
              :seconds => stop17306["items"][0]["seconds"]
            )
          when 5400
            stop.update_attributes(
              :seconds => stop5400["items"][0]["seconds"]
            )
          when 8011
            stop.update_attributes(
              :seconds => stop8011["items"][0]["seconds"]
            )
          when 2421
            stop.update_attributes(
              :seconds => stop2421["items"][0]["seconds"]
            )
          when 8040
            stop.update_attributes(
              :seconds => stop8040["items"][0]["seconds"]
            )
          when 668
            stop.update_attributes(
              :seconds => stop668["items"][0]["seconds"]
            )
          when 660
            stop.update_attributes(
              :seconds => stop660["items"][0]["seconds"]
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
