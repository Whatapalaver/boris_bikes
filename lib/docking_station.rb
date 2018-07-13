require_relative './bike.rb'

class DockingStation
	DEFAULT_CAPACITY = 20
	attr_reader :bikes
	# def bikes
	#	@bikes
	# end
	def initialize
		@bikes = []
	end

	def dock(bike)
		fail "The dock is full" if full? 
		@bikes << bike
	end

	def release_bike
		fail "There are no bikes available here" if empty?		
		 @bikes.pop
	end

	private
	def full?
		@bikes.length >= DEFAULT_CAPACITY
	end
	
	def empty?
		@bikes.empty?
	end

	
end
