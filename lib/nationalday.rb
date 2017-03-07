class NationalDay
	attr_accessor :name, :url, :summary, :image
	attr_reader :has_details
	def initialize(hash)
		hash.each do |k,v|
			self.send("#{k}=",v)
		end
		@has_details=false
	end

	#add details from the provided has, if no hash is provided details with automatically be pulled from the url
	#Checkl to see if #has_details is true to avoid excess network requests
	def add_details(hash=Scraper.scrape_day_details(url))
		hash.each do |k,v|
			#tfw you cant check to see if a method is defined with a string, only a symbol
			self.send("#{k}=",v)
		end
		@has_details=true
	end

	def ==(other)
		name==other.name&&url==other.url&&summary==other.summary&&image==other.image
	end
end
