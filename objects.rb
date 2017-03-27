

class Station
	attr_accessor :id

	def initialize(id)
		@id = id
		@list_sensors = Array.new # for sensors
	end

	def add_sensor(instance_sensor)
		@list_sensors.push(instance_sensor)
	end

	def get_sensors()
		return (@list_sensors)
	end
end


class Sensor
	class Data
		attr_accessor :size

		def initialize(id, origin_id)
			@id = id
			@origin_id = origin_id
		end

	end
	
	attr_accessor :id
	@datatype # Short-Text(1Kbytes), Text(10Kbytes), Photo(1Mbytes), Video(10Mbytes)
	@datafreq # number of data generation in 1 mins

	def initialize(id, station_id, datatype="Short-Text", datafreq=1)
		@id = id
		@datatype = datatype
		@datafreq = datafreq
		@station_id = station_id
	end

	def create_data(data_id)
		data = Data.new(data_id, @id)
		if (@datatype == "Short-Text") then
			data.size = 1024 #bytes
		end
		if (@datatype == "Text") then
			data.size = 1024*10 #bytes
		end
		if (@datatype == "Photo") then
			data.size = 1024*1024 #bytes
		end
		if (@datatype == "Video") then
			data.size = 1024*1024*10 #bytes
		end

		if (data.size == nil) then
			raise # Raising error
		end

		return (data)
	end

	def calc_interval()
#	    interval = 60.0/@datafreq # temporal solution, IMPROVE 
	    interval = rand(60)
		return (interval)
	end

end

class Bus
	attr_accessor :id
end

