#
#
#

require './objects.rb'

def calc_interval(number_events)
	interval = 60.0/number_events # temporal solution, IMPROVE

	return (interval)
end

class Eventlist
	attr_accessor :events

	def initialize()
		@events = Array.new
	end

	def create_GENDATA(time, data_id, sensor_id, datasize)
		# Creating Events
		info = [data_id, sensor_id, datasize]
		event = [time, "GENDATA", info] # [TIME, EVENT_TYPE, INFORMATION]
		@events.push(event)
	end

	def sort()
		@events = @events.sort do |a,b| a[0] <=> b[0] end
	end

	def print()
		@events.each do |event|
			p event
		end
	end
	
end

# Initialization
NUM_STATIONS=4
NUM_SENSORS=10
TIME_FINISH = 180 # Finish time in Seconds

list_stations = Array.new
k = 0
for i in 0..(NUM_STATIONS-1) do
	station_id = sprintf("station-%03d", i)
	station = Station.new(station_id)
	list_stations.push(station)
	
	for j in 0..(NUM_SENSORS-1) do
	    sensor_id = sprintf("sensor-%03d", k)
		#sensor = Sensor.new(sensor_id, "Video", 2)
		sensor = Sensor.new(sensor_id, station_id)
		station.add_sensor(sensor)

#		printf("Station:[%s] Sensor:[%s]\n", station_id, sensor_id)
		k += 1
	end
end

# Event: Data generation
eventlist = Eventlist.new()
count_data = 0
list_stations.each do |station|
	sensors = station.get_sensors()
	sensors.each do |sensor|
		time = 0.0
		while (time < TIME_FINISH) do
	  		data_id = sprintf("Data%08d", count_data)
	  		data = sensor.create_data(data_id)
	  		interval = sensor.calc_interval()
	  		count_data += 1

			# Creating Events
			eventlist.create_GENDATA(time, data_id, sensor.id, data.size)

			time += interval
		end

	end
end

# Event(TRANSDATA): Data transmission from Sensor to Station
eventlist.sort()
eventlist.events.each do |event|
  if (event[1] == "GENDATA") then
	# check sensor id
	sensor_id = event[2][1]
p event
p sensor_id

	# find station id from the sensor id
	## 1. instance of sensor with the sensor_id
	
	# create data transfer event from sensor to station
  end

end

#eventlist.print()


