class NationalDayList

	attr_accessor :use_cache
	MONTHS= ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
	URL_BASE = "http://www.nationaldaycalendar.com/"

	def initialize(use_cache=true)
		@use_cache = use_cache
		@cache = {}
	end

	def get_month(input)
		id = get_month_id(input)
		month = @cache[id] if use_cache
		month = DayOfMonth.array_from_hash_array(Scraper.scrape_month("#{URL_BASE}#{id}/")) if @cache[id]==nil || !use_cache
		@cache[id] = month if use_cache
		month
	end

	def cached?(input)
		@cache[get_month_id(input)]!=nil&&use_cache
	end

	def clear_cache
		@cache = {}
	end

	private
	def get_month_id(input)
		index = get_month_index(input)
		return MONTHS[index] unless index < 0
		nil
	end

	def get_month_index(input)
		return input if input.class==Fixnum
		return input.to_i()-1 unless input.to_i()==0
		MONTHS.find_index(input.downcase)
	end

end
