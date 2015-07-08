class StaticPageController < ApplicationController

	def about
	end

	def bus_routes
		@stops = Stop.all
	end

end
