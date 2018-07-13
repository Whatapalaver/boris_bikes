require_relative './bike.rb'

class DockingStation
	DEFAULT_CAPACITY = 20
	attr_reader :bikes, :capacity
	# def bikes
	#	@bikes
	# end
	def initialize(capacity = DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity
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
		@bikes.length >= @capacity
	end
	
	def empty?
		@bikes.empty?
	end

	
end
