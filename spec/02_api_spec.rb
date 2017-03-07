require_relative '../config/enviroment'

march_7th = NationalDay.new({})
march_7th.name = "National Cereal Day"
march_7th.url = "http://nationaldaycalendar.com/national-cereal-day-march-7/"

march_7th_summary = NationalDay.new({})
march_7th_summary.name = "National Cereal Day"
march_7th_summary.url = "http://nationaldaycalendar.com/national-cereal-day-march-7/"
march_7th_summary.summary = "Get your bowl and your spoon ready for March 7 is National Cereal Day. Since the end of the 19th century, cereal has become America’s most popular breakfast food."

api = NationalDayApi.new()
describe "NationalDayApi" do


	describe '#get_month' do
		it 'Returns the corrent month for string "March"' do
			expect(api.get_month("March")[0].title).to eq("March 1st")
		end
		it 'Returns the corrent month for string "3"' do
			expect(api.get_month("3")[0].title).to eq("March 1st")
		end
		it 'Returns the corrent month for integer 2' do
			expect(api.get_month(2)[0].title).to eq("March 1st")
		end
	end

	describe '#cached?' do
		it 'Returns the correct cache state for string "march"' do
			expect(api.cached?("march")).to eq(true)
		end
		it 'Returns the correct cache state for string "3"' do
			expect(api.cached?("3")).to eq(true)
		end
		it 'Returns the correct cache state for integer 2' do
			expect(api.cached?(2)).to eq(true)
		end
	end

	describe '#clear_cache' do
		it 'Clears the cache' do
			api.clear_cache
			expect(api.cached?("march")).to eq(false)
		end
	end

	describe '#use_cache' do
		it 'prevents caching when false' do
			api.use_cache=false
			expect(api.get_month("march")[0].title).to eq("March 1st")
			expect(api.cached?("march")).to eq(false)
		end
	end

end

describe "NationalDay" do
	nday = api.get_month("march")[6].days[2]
	it "It has the correct values" do
		expect(nday).to eq(march_7th)
	end
	describe "#add_details" do
		it "Grabs summary information and sets has_details to true" do
			expect(nday.has_details).to eq(false)
			nday.add_details
			expect(nday.has_details).to eq(true)
			expect(nday).to eq(march_7th_summary)
		end
	end
end
