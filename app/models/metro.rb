class Metro < ActiveRecord::Base
  def self.getStops
    response = HTTParty.get("http://api.metro.net/agencies/lametro/routes/704/stops/")

  end
end
