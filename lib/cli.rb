require_relative '../config/enviroment'

class CLI

	MONTHS= ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]

	def initialize()
		@cache = {}
	end

	def run
		loop do
			print '>'
			cmd = gets.chomp.split(" ")
			case cmd[0]
			when "exit"
				return;
			else
				parseDateCommand(cmd);
			end
		end
	end

	private
	def parseDateCommand(cmd)
		case cmd.length
		when 1
			month = getMonth(cmd[0])
			if month
				month.count.times {|index| printDay(month[index].title, cmd[0], month[index].days, index)}
			end
		end
	end

	#takes a string or number representing a month
	def getMonth(id)
		id = MONTHS[id.to_i-1] unless id.to_i==0
		id = id.downcase
		if MONTHS.include?(id)
			if(@cache[id]!=nil)
				@cache[id]
			else
				@cache[id] = DayOfMonth.array_from_hash_array(Scraper.scrape_month("http://www.nationaldaycalendar.com/#{id}/"))
			end
		else
			puts "Month does not exist: #{id}"
			nil
		end
	end

	#takes a day of month
	def printDay(readable_name, month_name, days, index_in_month)
		puts "#{readable_name}"
		days.each_with_index do |nday, index|
			puts "	#{month_name} #{index_in_month+1} #{index+1}. #{nday.name}"
		end
		puts ""
	end

end
