require 'spec_helper'

describe "Panda", type: :model do
	let (:no_name_panda){ Panda.new }
	let (:named_panda) { Panda.new(name: "Super Panda") }
	let (:duplicated_panda) { Panda.new(name: "Double Panda") }
	let (:duplicated_panda2) { Panda.new(name: "Double Panda") }
	
	it "should not be valid if it doesn't have a name" do
       expect(no_name_panda).to_not be_valid
	end

	it "shoud be valid if it has a name" do
		expect(named_panda).to be_valid
	end

	it "should not be valid if it has the same name as an existing Panda" do
		duplicated_panda2.save
		expect(duplicated_panda).to_not be_valid
	end

	context "Integration" do
       it "should save a named panda on the database" do
       	  expect { named_panda.save }.to change{ Panda.count }.by(1)
       end
	end
end