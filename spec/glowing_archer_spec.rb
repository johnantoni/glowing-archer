require 'spec_helper'

describe Glowing::Archer do

	context "Array" do
  	it "should drop_nils from arrays" do
  		["", "a"].drop_nil.should eq ["a"]
  	end
	end

	context "Boolean" do
	end

	context "Numeric" do
	end

	context "String" do
	end

	context "Time" do
	end

end