require 'spec_helper'

describe PandaController, type: :controller do
	context "#create_panda" do
        let (:create_panda_contract) {
        	{
        		format: "json",
        		panda: {
        			name: "Super Panda"
        		}
        	}
        }

		it "should create a panda if panda does not exist yet" do
			expect{ post :create_panda, create_panda_contract }.to change{ Panda.count }.by(1)
			expect(JSON.parse(response.body)["name"]).to eq("Super Panda")
		end

		it "should not create a panda if panda doesn't have a name" do
			create_panda_contract[:panda][:name] = ""
			expect{ post :create_panda, create_panda_contract }.to_not change{ Panda.count }
		end
	end
end
