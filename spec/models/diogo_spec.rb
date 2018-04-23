require 'spec_helper'
describe "Diogo" do
	context "strange name" do
		it "should change to Dioga" do
			Diogo.new.name.should be_eql("Dioga")
		end
	end
end