require 'rails_helper'
require 'factory_girl'


RSpec.describe Card, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"

	describe "is invalid without a " do     

		# let(:card){ card.new(valid_attributes) }

		it "number" do
			card = build(:card)	
	      card.number = nil       
	      expect(card).to be_invalid     
	   end 

		it "balance" do
			card = build(:card)	
	      card.balance = nil       
	      expect(card).to be_invalid     
	   end 

		it "expire_month" do
			card = build(:card)	
	      card.expire_month = nil       
	      expect(card).to be_invalid     
	   end 

		it "expire_year" do
			card = build(:card)	
	      card.expire_year = nil       
	      expect(card).to be_invalid     
	   end 

	end

end
