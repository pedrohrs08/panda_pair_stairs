require 'spec_helper'

describe PairController, type: :controller do 
	render_views
	
	before do 
		Panda.create!(name: "Panda1")
		Panda.create!(name: "Panda2")
	end

	context "#create_pair" do
		let(:create_pair_contract) {
		 {
			format: 'json',
			pair: {
				first_panda: 'Panda1',
				second_panda: 'Panda2',
				date_of_pairing: '2014-10-21',
				work_done: 'description of the work that was done'
			}
		  }
		}
		it "should create a valid pair record when I post a valid json" do
			expect { post :create_pair, create_pair_contract }.to change{ Pair.count }.by(1)
			expect(JSON.parse(response.body)["errors"]).to be_empty
			expect(JSON.parse(response.body)["pair"]["first_panda"]).to eq(create_pair_contract[:pair][:first_panda])
		end

		it "should not create an invalid pair record when I post an invalid json" do
			create_pair_contract[:pair][:first_panda] = ""
			expect { post :create_pair, create_pair_contract }.to_not change{ Pair.count }
			expect(JSON.parse(response.body)["errors"]).to_not be_empty
			expect(JSON.parse(response.body)["errors"]["first_panda"]).to include("can't be blank")
		end
	end
	
	context "#get_pairs_within_period" do
	   before(:each) do
	   	 Pair.create!(first_panda: "Panda1", second_panda: "Panda2", date_of_pairing: Date.parse('2014-01-01'))
	   	 Pair.create!(first_panda: "Panda1", second_panda: "Panda2", date_of_pairing: Date.parse('2010-01-01'))
	   end

	   it "should return pair for a given period" do
	   	 get :get_pairs_within_period, start_date: '2013-01-01', end_date: '2015-01-01', format: 'json'
		 pairs = JSON.parse(response.body)["pairs"]
	   	 expect(pairs).to_not be_empty
	   	 expect(pairs.count).to eq 1
	   	 expect(Date.parse(pairs.first["date_of_pairing"])).to eq Date.parse('2014-01-01')
	   end
	end
end