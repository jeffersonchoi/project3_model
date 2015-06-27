namespace :busapi do
  desc "make the bus model update from API"
  task update: :environment do
    #create an arry to store the buses that are going to be in our database.
    busarray = []

    routes = HTTParty.get("http://api.metro.net/agencies/lametro/routes/")
    routes["items"].each do |r|
      #if the route id is not 704 and 733 and 734, then it will keep going and search for other routes
      if r["id"] != "704"
        #  && r["id"] != "733" && r["id"] != "734"
          next
      end
      route = Route.find_or_create_by(api_id: r["id"]) do |row|
          row.name = r["display_name"]
      end


      buses = HTTParty.get("http://api.metro.net/agencies/lametro/routes/" + r["id"] + "/vehicles/")

      buses["items"].each do |b|

        if b["run_id"]

          if b["run_id"].split("_").last == "0"

          # Create the bus if not exists in database
            bus = Bus.find_or_create_by(api_id: b["id"]) do |row|
                row.name = b["id"]
                row.route_id = route.id
                row.latitude = b["latitude"]
                row.longitude = b["longitude"]
            end

          # Update the bus after finding or creating the bus
            bus.update_attributes(
                :name =>  b["id"],
                :route_id =>  route.id,
                :latitude =>  b["latitude"],
                :longitude => b["longitude"]
            )
            #push the buses inside our busarray
            busarray.push(bus.id)
          end

        end



      end if buses["items"]
      puts "updated"
      puts busarray.count

    end
    #with all the buses in our database, compare them with the busarray
    bus = Bus.all.each do |bus|
      # if the busarray has the selected bus id from database
      if busarray.include?(bus.id)
        puts bus.id
      #or else, the selected bus from the database will be destroyed.
      else
        puts bus.id
        puts "testing"
        bus.destroy
      end
    end

  end


end
