
A simple api & cli for getting a list of national days from 'www.nationaldaycalendar.com'.

# Installation

Requires ruby and bundler. Ruby dev may need to be installed.

Clone the project and cd into the newly created folder.
	bundle install

# Running
	bundle exec ruby bin/run

# Api Usage
	#Create the api with caching
	api = NationalDayApi.new
	#Create the api without caching
	api = NationalDayApi.new(false)

	#Get a month. You can alse specify its number ("3") or index (2)
	month = api.getMonth("march")

	#Returns true if the month is cached, teks the same perameters as #getMonth
	cached = api.isCached("march")

	#getMonth will cache the month when called and return the cached data if available
	#Clear the cache
	api.clear_cache()

	#Get the first day of the month
	day = month[0]
	#Get a readable title from the day
	title = day.title

	#Get the first national day at this date
	nday = day.days[0]
	#get National Day name
	nday_name = nday.name
	#Get summary
	#Fetch details if we don't already have them
	nday.add_details unless nday.has_details
	nday_summary = nday.summary
