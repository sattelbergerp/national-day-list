class DayOfMonth
	attr_accessor :title, :days

	def initialize(hash)
		hash.each do |k,v|
			self.send("#{k}=",v)
		end
	end

end
