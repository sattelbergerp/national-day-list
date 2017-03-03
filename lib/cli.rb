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
		when 2..4
			month = getMonth(cmd[0])
			day = cmd[1].to_i-1
			if month
				if day > -1 && day < month.count
					case cmd.length
					when 2
						printDay(month[day].title, cmd[0], month[day].days, day)
					when 3
						printDayDetails(month[day].title, cmd[0], month[day].days, day, month[day].days[cmd[2].to_i-1])
					end
				else
					puts "Invalid day"
				end
			else
				puts "Invalid date command"
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

	def printDayDetails(readable_name, month_name, days, index_in_month, national_day)
		national_day.add_details unless national_day.has_details
		puts "#{national_day.url}"
		puts "#{national_day.name}"
		puts "#{national_day.summary}"
	end

end
