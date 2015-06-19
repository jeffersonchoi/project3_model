class StopTime < ActiveRecord::Base
  belongs_to :bus
  belongs_to :route_stop
end
