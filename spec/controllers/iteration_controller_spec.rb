require 'spec_helper'

describe IterationController, :type => :controller do
	render_views
	
	let(:create_iteration_contract){
		{
			format: 'json',
			iteration: {
				name: "Iteration 1",
				start: Date.new,
				end: Date.new
			}
		}

	}

	context "#create_iteration" do
		it "should create a iteration when contract is correct" do 
			expect {post :create_iteration, create_iteration_contract}.to change{ Iteration.count }.by(1)
			expect(JSON.parse(response.body)["iteration"]["name"]).to eq("Iteration 1")
			expect(JSON.parse(response.body)["errors"]).to be_empty
		end

		it "should not create a iteration when contract is incorrect" do 
			create_iteration_contract[:iteration][:name] = nil
			expect {post :create_iteration, create_iteration_contract}.to_not change{ Iteration.count }
			expect(JSON.parse(response.body)["errors"]["name"]).to include("can't be blank")
		end
	end

end
