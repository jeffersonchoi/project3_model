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

          # if b["id"].exists? == true && Bus.find_by(api_id: b["id"]) == nil

              # Create the bus
              bus = Bus.find_or_create_by(api_id: b["id"]) do |row|
                  row.name = b["id"]
                  row.route_id = route.id
                  row.latitude = b["latitude"]
                  row.longitude = b["longitude"]
              end

          # else





      end if buses["items"]
      puts "updated"

    end
  end

end
