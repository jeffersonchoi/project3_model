class StopTime < ActiveRecord::Base
  belongs_to :bus
  belongs_to :route_stop
  has_one :route, through: :route_stop
  has_one :stop, through: :route_stop
end
