#grab all the stops from the api pages

namespace :arrival do
  desc "make the bus model update from API"
  task jefferson: :environment do

    start = 17306
    ending = 999999999

    while start < ending do

      prediction = HTTParty.get("http://api.metro.net/agencies/lametro/stops/" + "#{start}" + "/predictions/")
      start += 1;

      prediction["items"].each do |p|


        if p["run_id"]
          #grabbing only run id starts with 704 and ends with 0
          if p["run_id"].split("_").first == "704" &&  p["run_id"].split("_").last == "0"

            puts p["run_id"]
            puts start-1



          end
        end
      end

    end

  end

end
