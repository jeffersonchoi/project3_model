namespace :busapi do
  desc "make the bus model update from API"
  task update: :environment do

    busarray = []

    routes = HTTParty.get("http://api.metro.net/agencies/lametro/routes/")
    routes["items"].each do |r|

      if r["id"] != "704" && r["id"] != "733" && r["id"] != "734"
          next
      end

      route = Route.find_or_create_by(api_id: r["id"]) do |row|
          row.name = r["display_name"]
      end


      buses = HTTParty.get("http://api.metro.net/agencies/lametro/routes/" + r["id"] + "/vehicles/")

      buses["items"].each do |b|




          # Create the bus if not exists
          bus = Bus.find_or_create_by(api_id: b["id"]) do |row|
              row.name = b["id"]
              row.route_id = route.id
              row.latitude = b["latitude"]
              row.longitude = b["longitude"]
          end

          bus.update_attributes(
              :name =>  b["id"],
              :route_id =>  route.id,
              :latitude =>  b["latitude"],
              :longitude => b["longitude"]
          )
          busarray.push(bus.id)



      end if buses["items"]
      puts "updated"
      puts busarray.count

    end

    bus = Bus.all.each do |bus|
      if busarray.include?(bus.id)
        puts bus.id
      else
        puts bus.id
        puts "testing"
        bus.destroy
      end
    end

  end


end
