namespace :busapi do
  desc "make the bus model update from API"
  task update: :environment do


    response = HTTParty.get("http://api.metro.net/agencies/%20lametro/routes/704/vehicles/")
    @buses = Bus.getBuses["items"]

    Bus.destroy_all
    @buses.each do |bus|

      Bus.create(latitude: bus["latitude"], name: bus["id"],
          longitude: bus["longitude"])

    end
    puts "updated"
  end

end
