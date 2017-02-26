require_relative '../config/enviroment'

describe "Scraper" do
	it "exists" do
		expect{ Scraper }.to_not raise_exception
	end
end
