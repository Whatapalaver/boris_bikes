require_relative './bike.rb'

class DockingStation
	attr_reader :bike
	def release_bike
		fail "There are no bikes available here" unless @bike		
		
		 @bike
	end
	def dock(bike)
		@bike = bike
	end
end
