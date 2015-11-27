require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

	let(:valid_session) { {used_id: 1} }

	describe " GET new" do  
		it " new page loads successfully" do 
			# use get to call the 'new' action with no params
			get :new, {}
			# we expect the variable @dog to be an instance of dog 
			expect(response).to have_http_status(:success)
		end 
	end

	describe " POST create" do 
		context " user" do 
			it " check that @user is an instance of User" do 
				user = create(:user)
				a = attributes_for(:user)
				post :create, {email: a[:email], password: a[:password]}
				expect(assigns(:user)).to be_an_instance_of(User)
			end

			it " check that @user_id is saved to session" do 
				user = create(:user)
				a = attributes_for(:user)
				post :create, {email: a[:email], password: a[:password]}
				expect(session[:user_id]).to eq(user.id)
			end

			it " check that page is redirected to home" do 
				user = create(:user)
				a = attributes_for(:user)
				post :create, {email: a[:email], password: a[:password]}
				expect(response).to redirect_to home_path
			end 	
		end

		context " invalid_password_valid_username" do 
			it " check that @user is an instance of User" do 
				user_good = create(:user)
				user = build(:user_bad_pw)
				a = attributes_for(:user_bad_pw)
				post :create, {email: a[:email], password: a[:password]}
				expect(assigns(:user)).to be_an_instance_of(User)
			end

			it " check that session creation fails" do 
				user_good = create(:user)
				user_bad = build(:user_bad_pw)
				a = attributes_for(:user_bad_pw)
				post :create, {email: a[:email], password: a[:password]}
				expect(session[:user_id]).to eq(nil)
			end

			it " check that page is redirected to login_path" do 
				user_good = create(:user)
				user_bad = build(:user_bad_pw)
				a = attributes_for(:user_bad_pw)
				post :create, {email: a[:email], password: a[:password]}
				expect(response).to redirect_to login_path
			end 	
		end
		context " invalid_username" do 
			it " check that @user lookup fails and equals nil" do 
				user_good = create(:user)
				user = build(:user_bad_email)
				a = attributes_for(:user_bad_email)
				post :create, {email: a[:email], password: a[:password]}
				expect(assigns(:user)).to eq(nil)
			end

			it " check that session creation fails" do 
				user_good = create(:user)
				user = build(:user_bad_email)
				a = attributes_for(:user_bad_email)
				post :create, {email: a[:email], password: a[:password]}
				expect(session[:user_id]).to eq(nil)
			end

			it " check that page is redirected to login_path" do 
				user_good = create(:user)
				user_bad = build(:user_bad_email)
				a = attributes_for(:user_bad_email)
				post :create, {email: a[:email], password: a[:password]}
				expect(response).to redirect_to login_path
			end 	
		end 

	end	# describe POST create end

end
