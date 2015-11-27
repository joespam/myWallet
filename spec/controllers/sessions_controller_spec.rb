require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

	describe "GET new" do  
		it " new page loads successfully" do 
			# use get to call the 'new' action with no params
			get :new, {}
			# we expect the variable @dog to be an instance of dog 
			expect(response).to be success
		end 
	end

	describe " POST create" do 
		context " user" do 
			it " check that @session is assigned" do 
				post :create, {user: attributes_for(:user}, valid_session
				expect(assigns(:user)).to be_an_instance_of(User)
			end

			# it " check that @dog is saved to db" do 
			# 	post :create, {dog: attributes_for(:dog)}, valid_session
			# 	expect(Dog.all.count).to eq(1)
			# end

			# it " check that page is redirected to @dog" do 
			# 	post :create, {dog: attributes_for(:dog)}, valid_session
			# 	expect(response).to redirect_to (assigns(:dog))
			# end 	
		end

		context " invalid_password_valid_username" do 
		end
		context " invalid_username" do 
			# it " check that @dog is assigned" do 
			# 	post :create, {dog: attributes_for(:invalid_dog)}, valid_session
			# 	expect(assigns(:dog)).to be_an_instance_of(Dog)
			# end 

			# it " check that page is redirected to create a new dog" do 
			# 	post :create, {dog: attributes_for(:invalid_dog)}, valid_session
			# 	expect(response).to render_template(:new)
			# end 
		end 

	end	# describe POST create end

end
