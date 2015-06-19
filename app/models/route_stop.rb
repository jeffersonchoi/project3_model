class RouteStop < ActiveRecord::Base
  belongs_to :route
  belongs_to :stop
  has_many :stop_times
end
