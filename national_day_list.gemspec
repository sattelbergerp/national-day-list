Gem::Specification.new do |s|
	s.name = 'national_day_list'
	s.version='1.0.4'
	s.author = 'Patrick Sattelberger'
	s.email = 'sattelbergerp@gmail.com'

	s.date = Time.new.strftime('%Y-%m-%d')

	s.homepage = 'https://github.com/sattelbergerp/national-day-list'
	s.summary = "A simple api & cli for getting a list of national days from 'www.nationaldaycalendar.com'."
	s.license = 'MIT'

	s.require_paths = ['lib']
	s.add_runtime_dependency 'nokogiri', '1.7.0.1'
	s.add_runtime_dependency 'require_all', '~> 1.3'
	s.add_runtime_dependency 'launchy'
	s.add_runtime_dependency 'colorize'

	s.add_development_dependency 'rspec'
	s.add_development_dependency 'pry'

	s.files = ['LICENSE.txt',
	           'README.md',
					   'config/enviroment.rb',
					   'lib/cli.rb',
					   'lib/dayofmonth.rb',
					   'lib/nationaldaylist.rb',
					   'lib/scraper.rb',
						 'lib/nationalday.rb',
					   'bin/nationaldaylist',]

	s.executables << 'nationaldaylist'

end
