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

      Stop.destroy_all

      stops = Stop.create([
          {
            id: 1,
            name: "2nd / Santa Monica",
            latitude: 34.0150299,
            longitude: -118.49735,
            api_id: 29
          },
          {
            id: 2,
            name: "Ocean / Santa Monica",
            latitude: 34.0140399,
            longitude: -118.4977299,
            api_id: 4096
          },
          {
            id: 3,
            name: "Santa Monica / 4th",
            latitude: 34.0166499,
            longitude: -118.49468,
            api_id: 14360
          },
          {
            id: 4,
            name: "Santa Monica / Bundy",
            latitude: 34.0405699,
            longitude: -118.46304,
            api_id: 6041
          },
          {
            id: 5,
            name: "Santa Monica / Barrington",
            latitude: 34.0437499,
            longitude: -118.45578,
            api_id: 6039
          },
          {
            id: 6,
            name: "Santa Monica / Sepulveda",
            latitude: 34.0477999,
            longitude: -118.44351,
            api_id: 14424
          },
          {
            id: 7,
            name: "Santa Monica / Westwood",
            latitude: 34.0498699,
            longitude: -118.43622,
            api_id: 6058
          },
          {
            id: 8,
            name: "Santa Monica / Beverly Glen",
            latitude: 34.05769,
            longitude: -118.4237199,
            api_id: 6040
          },
          {
            id: 9,
            name: "Santa Monica / Avenue Of The Stars",
            latitude: 34.0615399,
            longitude: -118.41797,
            api_id: 5917
          },
          {
            id: 10,
            name: "Santa Monica / Wilshire",
            latitude: 34.06682,
            longitude: -118.4104899,
            api_id: 6050
          },
          {
            id: 11,
            name: "Santa Monica / Crescent",
            latitude: 34.07316,
            longitude: -118.4012699,
            api_id: 5985
          },
          {
            id: 12,
            name: "Santa Monica / San Vicente",
            latitude: 34.0849099,
            longitude: -118.38363,
            api_id: 14378
          },
          {
            id: 13,
            name: "Santa Monica / La Cienega",
            latitude: 34.0893299,
            longitude: -118.37608,
            api_id: 7946
          },
          {
            id: 14,
            name: "Santa Monica / Sweetzer",
            latitude: 34.09059,
            longitude: -118.37044,
            api_id: 6031
          },
          {
            id: 15,
            name: "Santa Monica / Fairfax",
            latitude: 34.0906999,
            longitude: -118.36172,
            api_id: 6014
          },
          {
            id: 16,
            name: "Santa Monica / Vista",
            latitude: 34.0906399,
            longitude: -118.3521399,
            api_id: 6052
          },
          {
            id: 17,
            name: "Santa Monica / La Brea",
            latitude: 34.09059,
            longitude: -118.3443,
            api_id: 6023
          },
          {
            id: 18,
            name: "Santa Monica / Highland",
            latitude: 34.09057,
            longitude: -118.33819,
            api_id: 6019
          },
          {
            id: 19,
            name: "Santa Monica / Vine",
            latitude: 34.0905899,
            longitude: -118.32633,
            api_id: 5386
          },
          {
            id: 20,
            name: "Santa Monica / Western",
            latitude: 34.0906599,
            longitude: -118.30891,
            api_id: 14436
          },
          {
            id: 21,
            name: "Santa Monica / Normandie",
            latitude: 34.0907,
            longitude: -118.2997799,
            api_id: 5387
          },
          {
            id: 22,
            name: "Santa Monica / Vermont",
            latitude: 34.0907699,
            longitude: -118.29203,
            api_id: 6033
          },
          {
            id: 23,
            name: "Santa Monica / Sanborn",
            latitude: 34.0924399,
            longitude: -118.28078,
            api_id: 1443
          },
          {
            id: 24,
            name: "Sunset / Parkman",
            latitude: 34.08296,
            longitude: -118.27353,
            api_id: 17306
          },
          {
            id: 25,
            name: "Sunset / Alvarado",
            latitude: 34.0775399,
            longitude: -118.26322,
            api_id: 5400
          },
          {
            id: 26,
            name: "Sunset / Echo Park",
            latitude: 34.0767099,
            longitude: -118.25755,
            api_id: 8011
          },
          {
            id: 27,
            name: "Sunset / Elysian Pk Dodger Stadium",
            latitude: 34.0726099,
            longitude: -118.2512499,
            api_id: 2421
          },
          {
            id: 28,
            name: "Sunset / Figueroa",
            latitude: 34.0626699,
            longitude: -118.24651,
            api_id: 8040
          },
          {
            id: 29,
            name: "Cesar E Chavez / Grand",
            latitude: 34.0603199,
            longitude: -118.2436999,
            api_id: 668
          },
          {
            id: 30,
            name: "Cesar E Chavez / Spring",
            latitude: 34.0581,
            longitude: -118.2388099,
            api_id: 660
          },
          {
            id: 31,
            name: "Patsaouras Transit Plaza",
            latitude: 34.05539,
            longitude: -118.2331199,
            api_id: 30000
          },
          {
            id: 32,
            name: "Center / Jackson Terminal",
            latitude: 34.0512399,
            longitude: -118.23093,
            api_id: 1605
          },
          {
            id: 33,
            name: "Patsaouras Transit Plaza",
            latitude: 34.05539,
            longitude: -118.2331199,
            api_id: 30000
          },
          {
            id: 34,
            name: "Cesar E Chavez / Broadway",
            latitude: 34.05881,
            longitude: -118.2404,
            api_id: 9221
          },
          {
            id: 35,
            name: "Cesar E Chavez / Grand",
            latitude: 34.0609,
            longitude: -118.24398,
            api_id: 16927
          },
          {
            id: 36,
            name: "Sunset / Figueroa",
            latitude: 34.0629399,
            longitude: -118.24641,
            api_id: 16329
          },
          {
            id: 37,
            name: "Sunset / Elysian Pk Dodger Stadium",
            latitude: 34.0726199,
            longitude: -118.2509199,
            api_id: 2422
          },
          {
            id: 38,
            name: "Sunset / Echo Park",
            latitude: 34.0770699,
            longitude: -118.25771,
            api_id: 16304
          },
          {
            id: 39,
            name: "Sunset / Alvarado",
            latitude: 34.0778,
            longitude: -118.2631499,
            api_id: 16318
          },
          {
            id: 40,
            name: "Sunset / Silver Lake",
            latitude: 34.0831499,
            longitude: -118.2732799,
            api_id: 8591
          },
          {
            id: 41,
            name: "Sunset / Hyperion",
            latitude: 34.0920999,
            longitude: -118.2798399,
            api_id: 16309
          },
          {
            id: 42,
            name: "Santa Monica / Vermont",
            latitude: 34.0909999,
            longitude: -118.29194,
            api_id: 14349
          },
          {
            id: 43,
            name: "Santa Monica / Normandie",
            latitude: 34.0909599,
            longitude: -118.3010899,
            api_id: 8598
          },
          {
            id: 44,
            name: "Santa Monica / Western",
            latitude: 34.0909099,
            longitude: -118.30949,
            api_id: 6056
          },
          {
            id: 45,
            name: "Santa Monica / Vine",
            latitude: 34.0908699,
            longitude: -118.32695,
            api_id: 14432
          },
          {
            id: 46,
            name: "Santa Monica / Highland",
            latitude: 34.09085,
            longitude: -118.3389199,
            api_id: 6018
          },
          {
            id: 47,
            name: "Santa Monica / La Brea",
            latitude: 34.0908499,
            longitude: -118.34457,
            api_id: 14401
          },
          {
            id: 48,
            name: "Santa Monica / Gardner",
            latitude: 34.09091,
            longitude: -118.35357,
            api_id: 14393
          },
          {
            id: 49,
            name: "Santa Monica / Fairfax",
            latitude: 34.0909599,
            longitude: -118.36122,
            api_id: 14391
          },
          {
            id: 50,
            name: "Santa Monica / Sweetzer",
            latitude: 34.0908399,
            longitude: -118.3706199,
            api_id: 14411
          },
          {
            id: 51,
            name: "Santa Monica / La Cienega",
            latitude: 34.0898799,
            longitude: -118.37604,
            api_id: 16240
          },
          {
            id: 52,
            name: "Santa Monica / San Vicente",
            latitude: 34.0849499,
            longitude: -118.3844,
            api_id: 6045
          },
          {
            id: 53,
            name: "Santa Monica / Canon",
            latitude: 34.0726199,
            longitude: -118.40253,
            api_id: 1296
          },
          {
            id: 54,
            name: "Santa Monica / Wilshire",
            latitude: 34.0673699,
            longitude: -118.41018,
            api_id: 2152
          },
          {
            id: 55,
            name: "Santa Monica / Avenue Of The Stars",
            latitude: 34.0612099,
            longitude: -118.4192,
            api_id: 14363
          },
          {
            id: 56,
            name: "Santa Monica / Westwood",
            latitude: 34.0498699,
            longitude: -118.43783,
            api_id: 14438
          },
          {
            id: 57,
            name: "Santa Monica / Sepulveda",
            latitude: 34.0476099,
            longitude: -118.44489,
            api_id: 14431
          },
          {
            id: 58,
            name: "Santa Monica / Barrington",
            latitude: 34.0437099,
            longitude: -118.45653,
            api_id: 14421
          },
          {
            id: 59,
            name: "Santa Monica / Bundy",
            latitude: 34.04084,
            longitude: -118.4630899,
            api_id: 14423
          },
          {
            id: 60,
            name: "Santa Monica / 26th",
            latitude: 34.03351,
            longitude: -118.4742999,
            api_id: 14359
          },
          {
            id: 61,
            name: "Santa Monica / 20th",
            latitude: 34.02859,
            longitude: -118.4803599,
            api_id: 14357
          },
          {
            id: 62,
            name: "Santa Monica / Lincoln",
            latitude: 34.0197199,
            longitude: -118.49134,
            api_id: 14379
          },
          {
            id: 63,
            name: "Broadway / 4th",
            latitude: 34.0149399,
            longitude: -118.4939,
            api_id: 5969
          },
          {
            id: 64,
            name: "Ocean / Santa Monica",
            latitude: 34.0140399,
            longitude: -118.4977299,
            api_id: 4096
          },
        ])
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
