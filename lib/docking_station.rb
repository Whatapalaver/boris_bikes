require_relative './bike.rb'

class DockingStation
	attr_reader :bikes
	# def bikes
	#	@bikes
	# end
	def initialize
		@bikes = []
	end
	def dock(bike)
		fail "The dock is full" unless @bikes.length < 20 
		@bikes << bike
		@bikes[@bikes.length - 1]
	end

	def release_bike
		fail "There are no bikes available here" unless !@bikes.empty?		
		 @bikes.pop
	end
end
