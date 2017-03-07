class NationalDayApi

	:attr_accessor use_cache
	MONTHS= ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]

	def initialize(use_cache=true)
		@use_cache = use_cache
		@cache = {}
	end

end
