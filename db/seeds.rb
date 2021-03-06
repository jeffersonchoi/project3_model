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
            # if b["run_id"].split("_").last == "0"
              # Create the bus
              bus = Bus.find_or_create_by(api_id: b["id"]) do |row|
                  row.name = b["id"]
                  row.route_id = route.id
                  row.latitude = b["latitude"]
                  row.longitude = b["longitude"]
                  busarray.push(row["api_id"])
              end


            puts busarray.count
            # end
          end
        # busarray.each do |array|
        #
        #   puts array
        #
        # end

        end if buses["items"]

      # Load the stops for the route
      i = 0
      stops = HTTParty.get("https://bus-stops-json.herokuapp.com/stops.json")
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
      stop1605 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/1605/predictions/")
      stop30000 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/30000/predictions/")
      stop9221 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/9221/predictions/")
      stop16927 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/16927/predictions/")
      stop16329 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/16329/predictions/")
      stop2422 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/2422/predictions/")
      stop16304 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/16304/predictions/")
      stop16318 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/16318/predictions/")
      stop8591 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/8591/predictions/")
      stop16309 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/16309/predictions/")
      stop14349 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14349/predictions/")
      stop8598 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/8598/predictions/")
      stop6056 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/6056/predictions/")
      stop14432 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14432/predictions/")
      stop6018 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/6018/predictions/")
      stop14401 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14401/predictions/")
      stop14393 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14393/predictions/")
      stop14391 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14391/predictions/")
      stop14411 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14411/predictions/")
      stop16240 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/16240/predictions/")
      stop6045 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/6045/predictions/")
      stop1296 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/1296/predictions/")
      stop2152 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/2152/predictions/")
      stop14363 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14363/predictions/")
      stop14422 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14422/predictions/")
      stop14438 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14438/predictions/")
      stop14431 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14431/predictions/")
      stop14421 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14421/predictions/")
      stop14423 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14423/predictions/")
      stop14359 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14359/predictions/")
      stop14357 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14357/predictions/")
      stop14379 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/14379/predictions/")
      stop5969 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/5969/predictions/")
      stop5985 = HTTParty.get("http://api.metro.net/agencies/lametro/stops/5985/predictions/")



      stops.each do |s|
        # stopABC = HTTParty.get("http://api.metro.net/agencies/lametro/stops/#{s["id"]}/predictions/")

        # Create the stop
          stop = Stop.create(api_id: s["api_id"]) do |row|
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
          #switch for the stops
          when 29
            stop29["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 4096
            stop4096["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                if s["run_id"].split("_").last == "0"
                  stop.update_attributes(
                   :seconds => s["seconds"],
                   :direction => "outbound"
                  )
                elsif s["run_id"].split("_").last == "1"
                  stop.update_attributes(
                   :seconds => s["seconds"],
                   :direction => "inbound"
                  )
                end

              break
              end
            end
          when 14360
            stop14360["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 6001
            stop6001["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 5977
            stop5977["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 5979
            stop5979["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 6041
            stop6041["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 6039
            stop6039["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 14424
            stop14424["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 6058
            stop6058["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 6040
            stop6040["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 5917
            stop5917["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 6050
            stop6050["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 6008
            stop6008["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 14378
            stop14378["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 7946
            stop7946["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 6031
            stop6031["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 6014
            stop6014["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 6052
            stop6052["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 6023
            stop6023["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 6019
            stop6019["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 5386
            stop5386["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 14436
            stop14436["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 5387
            stop5387["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 6033
            stop6033["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 1443
            stop1443["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 17306
            stop17306["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 5400
            stop5400["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 8011
            stop8011["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 2421
            stop2421["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 8040
            stop8040["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 668
            stop668["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 660
            stop660["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 1605
            stop1605["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 30000
            stop30000["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                if s["run_id"].split("_").last == "0"
                  stop.update_attributes(
                   :seconds => s["seconds"],
                   :direction => "outbound"
                  )
                elsif s["run_id"].split("_").last == "1"
                  stop.update_attributes(
                   :seconds => s["seconds"],
                   :direction => "inbound"
                  )
                end
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 9221
            stop9221["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 16927
            stop16927["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 16329
            stop16329["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 2422
            stop2422["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 16304
            stop16304["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 16318
            stop16318["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 8591
            stop8591["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 16309
            stop16309["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 14349
            stop14349["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 8598
            stop8598["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 6056
            stop6056["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 14432
            stop14432["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 6018
            stop6018["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 14401
            stop14401["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 14393
            stop14393["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 14391
            stop14391["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 14411
            stop14411["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 16240
            stop16240["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 6045
            stop6045["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 1296
            stop1296["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 2152
            stop2152["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 14363
            stop14363["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 14422
            stop14422["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 14438
            stop14438["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 14431
            stop14431["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 14421
            stop14421["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 14423
            stop14423["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 14359
            stop14359["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 14357
            stop14357["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 14379
            stop14379["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 5969
            stop5969["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end
          when 5985
            stop5985["items"].each do |s|
              if s["run_id"].split("_").first == "704"
                stop.update_attributes(
                 :seconds => s["seconds"]
                )
              break
              end
            end


          end








        # end
        # Create the route stop
        route_stop = RouteStop.create(route_id: route.id, stop_id: stop.id, order: i += 1)

        route.buses.each do |bus|

            # Link the buses to the route stop
            StopTime.create(bus_id: bus.id, route_stop_id: route_stop.id)

        end
      # end

      end



  end
