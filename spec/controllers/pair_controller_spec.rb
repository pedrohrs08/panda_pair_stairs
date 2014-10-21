require 'spec_helper'

describe PairController, type: :controller do 
	before do 
		Panda.create!(name: "Panda1")
		Panda.create!(name: "Panda2")
	end

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
	context "#create_pair" do
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
end