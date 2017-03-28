# dummy code

class Bus
#	attr_accessor :path
	def initialize(id)
		# .... > id
		@path = Array.new
	end

	# [["PATH", "A", "B", 20], ...
	# @path = [ Bus Action, action, action, ....]
	# Path = [ActionType, StationId1, StationId2, minutes]
	# Stop = [ActionType, StationId1, minutes]

	def add_path(station_id1, station_id2, minutes)
		action = ["MOVE", station_id1, station_id2, minutes]
		@path.push(action)
	end

	def add_stop(station_id, minutes)
		action = ["STOP", station_id, minutes]
		@path.push(action)
	end

	def print_path()
		@path.each do |path|
			p path
		end

	end

	def print_path_event()
		@path.each do |path|
			p path
		end

	end
end

bus1 = Bus.new("bus1")
bus2 = Bus.new("bus2")

# Initialize of Bus movement
bus1.add_stop("A", 5)
bus1.add_path("A", "B", 20)
bus1.add_stop("B", 10)
bus1.add_path("B", "C", 15)
bus1.add_stop("C", 60)

bus1.print_path_event()

#
# A(5min) -(20min) -> B (10min) -(15min)-> C (60min)
#
#
exit

#
# time BusId StationId ARR/DEP
# 0 1 A arr
# 5 1 A dep
# 25 1 B arr
# 35 1 B dep
# 50 1 C arr
# 110 1 C dep
# 


