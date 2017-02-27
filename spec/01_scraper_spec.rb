require_relative '../config/enviroment'

feb_2_hash = {
	title: "Febuary 2nd",
	days: [
		{name: "National Groundhog Day", url: "http://nationaldaycalendar.com/national-groundhog-day-february-2/"},
		{name: "National Heavenly Hash Day", url: "http://nationaldaycalendar.com/national-heavenly-hash-day-february-2/"}
	]
}

describe "Scraper" do
	it "exists" do
		expect{ Scraper }.to_not raise_exception
	end

	describe "#scrape_month" do
		#Is it bad to put code outside of tests?
		national_days = Scraper.scrape_month("../fixtures/holiday-site/febuary.html")
		it "returns the correct number of days" do
			expect(national_days.count).to eq(28)
		end
		it "returns the corrent hash for a day" do
			expect(national_days[1]).to eq(feb_2_hash)
		end
	end
end
