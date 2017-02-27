require_relative '../config/enviroment'

feb_2_hash = {
	title: "February 2nd",
	days: [
		{name: "National Groundhog Day", url: "http://nationaldaycalendar.com/national-groundhog-day-february-2/"},
		{name: "National Heavenly Hash Day", url: "http://nationaldaycalendar.com/national-heavenly-hash-day-february-2/"}
	]
}

feb_2_1_first_details = {
	title: "NATIONAL GROUNDHOG DAY",
	summary: "Groundhog Day is observed on February 2nd, each year in the United States and Canada.  For a nice welcomed break during the winter, on this day the groundhog awakens from his nap and goes outside to see if he can see his shadow.  It is believed by many that if the groundhog sees his shadow that there will then be six more weeks of winter. If this is so,  he then retrieves back into his den and goes back to sleep.  If he is not able to see his shadow, the groundhog remains outside to play and people celebrate believing that spring is just around the corner.",
	image: "http://www.nationaldaycalendar.com/wp-content/uploads/2014/06/National-Groundhog-Day-February-2-e1484600526463.jpg"
}

describe "Scraper" do
	it "exists" do
		expect{ Scraper }.to_not raise_exception
	end

	describe "#scrape_month" do
		#Is it bad to put code outside of tests?
		national_days = Scraper.scrape_month("http://www.nationaldaycalendar.com/february/")
		it "returns the correct number of days" do
			expect(national_days.count).to eq(28)
		end
		it "returns the corrent hash for a day" do
			expect(national_days[1]).to eq(feb_2_hash)
		end
	end

	describe "#scrape_day_details" do
		it "returns the correct hash" do
			expect(Scraper.scrape_day_details("http://www.nationaldaycalendar.com/national-groundhog-day-february-2/")).to eq(feb_2_1_first_details)
		end
	end

end
