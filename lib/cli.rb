require_relative '../config/enviroment'

class CLI

	MONTHS= ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]

	attr_reader :api

	def initialize()
		@cache = {}
		@api = NationalDayList.new()
	end

	def run
		puts "CLI for 'www.nationaldaycalendar.com'. Type 'help' for usage."
		loop do
			print '>'
			cmd = gets.chomp.split(" ")
			case cmd[0]
			when "exit"
				return;
			when "today"
				date = Date.today
				parseDateCommand([date.month, date.mday] + cmd[1..-1])
			when 'help'
				puts "Type '1' or 'january' to view all national days for january."
				puts "Type '1 2' or 'january' first to view all national days for january second."
				puts "Type '1 2 4' to view the fourth national day for january second."
				puts "Month and day of month can be replaced with 'today' in all commands."
				puts "Type 'exit' to exit"
			else
				parseDateCommand(cmd);
			end
		end
	end

	private
	def parseDateCommand(cmd)
		puts "Loading Month Information..." unless api.cached?(cmd[0])
		month = api.get_month(cmd[0])
		if month
			if cmd.count > 1
				parseDayCommand(cmd, month)
			else
				month.count.times {|index| printDay(month[index], cmd[0], index+1)}
			end
		else
			puts "Unknown month or command".colorize(:light_red)
		end
	end

	def parseDayCommand(cmd, month)
		day_index = cmd[1].to_i-1
		day = month[day_index]
		if day && day_index > -1
			if cmd.count>2
				parseDayDetailsCommand(cmd, month, day)
			else
				printDay(day, cmd[0], cmd[1])
			end
		else
			puts "Could not find day in month".colorize(:light_red)
		end
	end

	def parseDayDetailsCommand(cmd, month, day)
		nday_index = cmd[2].to_i-1
		nday = day.days[nday_index]
		if nday && nday_index>-1
			if cmd.count > 3
				parseDayOperationCommand(nday, cmd)
			else
				printDayDetails(nday, cmd[0], cmd[1], cmd[2])
			end
		else
			puts "Can't find national day on specified date".colorize(:light_red)
		end
	end

	def parseDayOperationCommand(nday, cmd)
		case cmd[3]
		when "open"
			Launchy.open(nday.url)
		else
			puts "Unknown command for national day".colorize(:light_red)
		end
	end

	#takes a day of month
	def printDay(day_of_month, month_name, day_name)
		puts "#{day_of_month.title}".colorize(:light_yellow)
		day_of_month.days.each_with_index do |nday, index|
			puts "	#{month_name} #{day_name} #{index+1}".colorize(:light_blue)+". #{nday.name}"
		end
		puts ""
	end

	def printDayDetails(national_day, month_name, day_name, nday_name)
		if !national_day.has_details
			puts "Loading National Day Information..."
			national_day.add_details
		end
		puts "#{national_day.url}"
		puts "#{national_day.name}".colorize(:light_yellow)
		puts "#{national_day.summary}" if national_day.summary!=nil && !national_day.summary.empty?
		puts ""
		puts "Type '#{month_name} #{day_name} #{nday_name} open' to view in your default browser."
	end

end
