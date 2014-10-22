require 'spec_helper'

describe PandaController, type: :controller do
	render_views
	
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
			panda_response = JSON.parse(response.body)
			expect(panda_response["panda"]["name"]).to eq("Super Panda")
			expect(panda_response["errors"]).to be_empty
		end

		it "should not create a panda if panda doesn't have a name" do
			create_panda_contract[:panda][:name] = ""
		
			expect{ post :create_panda, create_panda_contract }.to_not change{ Panda.count }
		    panda_response = JSON.parse(response.body)
		    expect(panda_response["errors"]).to_not be_empty
		    expect(panda_response["errors"]).to have_key("name")
		    expect(panda_response["errors"]["name"]).to include "can't be blank"       
		end
	end

	context "#pandas" do
		it "should return all the pandas" do
			Panda.create!(name: "Panda")
			get :pandas, { format: 'json' }
			p response.body
			expect(JSON.parse(response.body)["pandas"].count).to eq 1
		end
	end
end
