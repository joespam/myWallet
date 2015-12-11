require 'rails_helper'
require 'factory_girl'


RSpec.describe User, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"

	describe "is invalid without a " do     

		it "fname" do
			user = build(:user)	
	      user.fname = nil       
	      expect(user).to be_invalid     
	   end 

		it "lname" do
			user = build(:user)	
	      user.lname = nil       
	      expect(user).to be_invalid     
	   end 

		it "email" do
			user = build(:user)	
	      user.email = nil       
	      expect(user).to be_invalid     
	   end 

		it "unique email" do
			user = create(:user)	
			user2 = build(:user)	          
	      expect(user2).to be_invalid     
	   end 

		it "password" do
			user = build(:user)	
	      user.password = nil       
	      expect(user).to be_invalid     
	   end 

		it "phone" do
			user = build(:user)	
	      user.phone = nil       
	      expect(user).to be_invalid     
	   end 

	end
	describe "password input errors" do

		it "password too long" do
			user = build(:user)	
	      user.password = "6543210987654321"       
	      expect(user).to be_invalid     
	   end 	 

		it "password too short" do
			user = build(:user)	
	      user.password = "321"       
	      expect(user).to be_invalid     
	   end 	  

  		it "password_confirmation" do
  			# note: password confirmation is set only in validations;
  			# nowhere in the UI is a user required to confirm the pw
  			# so tests are not that extensive for it.
			user = build(:user, password_confirmation: "87654321")	     
	      expect(user).to be_invalid     
	   end 

	end
end
