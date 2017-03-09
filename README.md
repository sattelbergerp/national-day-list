# National Day List
A simple api & cli for getting a list of national days from 'www.nationaldaycalendar.com'.

## Dependencies
* Ruby
* Ruby gems

*Ruby dev may also be required*

## Installation

	gem install national_day_list

## Running
	nationaldaylist

## Api Usage

	require 'nationaldaylist'

	#Create the api with caching
	api = NationalDayList.new
	#Create the api without caching
	api = NationalDayList.new(false)

	#Get a month. You can alse specify its number ("3") or index (2)
	month = api.get_month("march")

	#Returns true if the month is cached, teks the same perameters as #get_month
	cached = api.cached?("march")

	#get_month will cache the month when called and return the cached data if available
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

## Contributing
Pull requests welcome
* Try to follow existing coding styles and patterns.
* Write new tests for new api changes (Adding information or features).
* Make sure all tests pass before submitting.

If you have questions or feedback you can contact me at sattelbergerp@gmail.com. 
*Yes I used two spaces for indentation; no I don't like it either.*

## License
MIT
See LICENSE.txt
