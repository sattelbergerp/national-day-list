class DayOfMonth
	attr_accessor :title, :days

	#utility method to take the array of hashes returned by the scraper and turn them into instances of this object
	def self.array_from_hash_array(hash_array)
		hash_array.collect {|hash|
			self.new(hash)
		}
	end

	def initialize(hash)
		hash.each do |k,v|
			self.send("#{k}=",v)
		end
		@days = @days.collect {|day| NationalDay.new(day)}
	end

end
