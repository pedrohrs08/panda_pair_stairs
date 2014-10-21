require 'spec_helper'

describe Pair, type: :model do
	before do 
		Panda.create!(name: "Panda1")
		Panda.create!(name: "Panda2")
	end

	let(:pair_missing_first_panda) { Pair.new(second_panda: "Panda2", date_of_pairing: Date.new) }
	let(:pair_missing_second_panda) { Pair.new(first_panda: "Panda1", date_of_pairing: Date.new) }
	let(:pair_missing_date_of_pairing) { Pair.new(first_panda: "Panda1", second_panda: "Panda2") }
	let(:duplicated_pandas_on_pairing) { Pair.new(first_panda: "Panda1", second_panda: "Panda1", date_of_pairing: Date.new) }
    let(:invalid_panda_assigned){ Pair.new(first_panda: "Panda1", second_panda: "Panda3", date_of_pairing: Date.new)  }
    let(:valid_panda){ Pair.new(first_panda: "Panda1", second_panda: "Panda2", date_of_pairing: Date.new)  }

    context "#valid" do
 		it "should not be valid when first_panda is missing" do
           expect(pair_missing_first_panda).to_not be_valid
 		end


 		it "should not be valid when second_panda is missing" do
           expect(pair_missing_second_panda).to_not be_valid
 		end


 		it "should not be valid when date_of_pairing is missing" do
           expect(pair_missing_second_panda).to_not be_valid
 		end


 		it "should not be valid when first_panda and second_panda are the same" do
           expect(duplicated_pandas_on_pairing).to_not be_valid
           expect(duplicated_pandas_on_pairing.errors[:first_panda]).to include('first panda should be differant than second panda')
 		end

 		it "should not be valid when assigned panda is not on mongodb" do
 			expect(invalid_panda_assigned).to_not be_valid
 		end

 		it "should be a valid pair record" do
 			expect(valid_panda).to be_valid
 		end
    end   
end