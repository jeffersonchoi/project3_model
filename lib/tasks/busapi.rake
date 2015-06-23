namespace :busapi do
  desc "make the bus model update from API"
  task update: :environment do



    routes = HTTParty.get("http://api.metro.net/agencies/lametro/routes/")
    routes["items"].each do |r|

      if r["id"] != "704" && r["id"] != "705" && r["id"] != "710"
          next
      end

      route = Route.find_or_create_by(api_id: r["id"]) do |row|
          row.name = r["display_name"]
      end

      buses = HTTParty.get("http://api.metro.net/agencies/lametro/routes/" + r["id"] + "/vehicles/")
      buses["items"].each do |b|



        puts Bus.find(api_id: 10000).id
          if b["id"] == nil && Bus.find_by(api_id: b["id"]) == true


              bus = Bus.find_by(api_id: b["id"])
              bus.destroy
          end

          # if b["id"] == true && Bus.find_by(api_id: b["id"]) == nil

              # Create the bus
              bus = Bus.find_or_create_by(api_id: b["id"]) do |row|
                  row.name = b["id"]
                  row.route_id = route.id
                  row.latitude = b["latitude"]
                  row.longitude = b["longitude"]
              end
          #
          # if b["id"] == nil  && Bus.find_by(api_id: b["id"]) == true
          #
          #     bus = Bus.find_by(api_id: b["id"])
          #     bus.destroy
          #
          # if b["id"].exists? == true && Bus.find_by(api_id: b["id"]).exists? == true

              # bus = Bus.find_by(api_id: b["id"]) do |row|
              #   bus.update_attribute
              #     row.name = b["id"]
              #     row.route_id = route.id
              #     row.latitude = b["latitude"]
              #     row.longitude = b["longitude"]
              #
              # end
          # end





      end if buses["items"]
      puts "updated"

    end
  end

end
