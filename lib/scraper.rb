
class Scraper

	#Used in openuri requests to prevent 403
	#Coppied from chrome on windows 10
	USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36"

	def self.scrape_month(full_url)
		doc = Nokogiri::HTML(open(full_url, 'User-Agent'=>USER_AGENT))
		days_of_month = []
		tiles = doc.css('div.et_pb_blurb_container')
		tiles.each do |tile|
			day_of_month = {}
			day_of_month[:title] = tile.css('h4').text
			day_of_month[:days] = tile.css('li a').collect do |day_link|
				{name: day_link.text, url: day_link.attr('href')}
			end
			days_of_month << day_of_month
		end
		days_of_month
	end

	def self.scrape_day_details(full_url)
		doc = Nokogiri::HTML(open(full_url, 'User-Agent'=>USER_AGENT))
		details = {}
		doc.css(".post-content > p").each do |item|
			if !item.text.strip.empty?
				details[:summary] = item.text.gsub("\u00A0", ' ')
				break
			end
		end
		details
	end

end
