require 'spec_helper'

describe Iteration, type: :model do 
	let(:endless_iteration){ Iteration.new(start: Date.new, name: "Iteration 1") }
	let(:startless_iteration){ Iteration.new(end: Date.new, name: "Iteration 2") }
	let(:nameless_iteration){ Iteration.new(start: Date.new, end: Date.new) }
	let(:backwards_iteration){ Iteration.new(start: Date.parse('2014-01-02'), end: Date.parse('2013-01-02'), name:"4 noitaretI") }
    let(:valid_iteration){ Iteration.new(start: Date.new, end: Date.new, name: "Iteration 5")}
    context "#valid?" do
    	it "should be a valid Iteration" do
    		expect(valid_iteration).to be_valid
    	end

    	it "should not be a valid Iteration when end is missing" do
    		expect(endless_iteration).to_not be_valid
    	end

    	it "should not be a valid Iteration when start is missing" do
    		expect(startless_iteration).to_not be_valid
    	end

    	it "should not be a valid Iteration when name is missing" do
    		expect(nameless_iteration).to_not be_valid
    	end

    	it "should not be a valid Iteration when start date is grater than the end date" do
    		expect(backwards_iteration).to_not be_valid
    	end
    end
end