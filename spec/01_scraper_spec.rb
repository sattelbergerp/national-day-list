require_relative '../config/enviroment'

feb_2_hash = {
	title: "February 2nd",
	days: [
		{name: "National Groundhog Day", url: "http://nationaldaycalendar.com/national-groundhog-day-february-2/"},
		{name: "National Heavenly Hash Day", url: "http://nationaldaycalendar.com/national-heavenly-hash-day-february-2/"}
	]
}

feb_2_1_first_details = {
	summary: "Will he see his shadow or will he not?  That is the question!",
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
