require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

	let(:valid_session) { {user_id: 1} }

	describe " GET new" do  
		it " check that @user is an instance of User" do 
			user = create(:user)
			get :new, {}
			expect(assigns(:user)).to be_an_instance_of(User)
		end

		it " new page loads successfully" do 
			# get the 'new' action with no params
			get :new, {}
			# verify page loaded
			expect(response).to have_http_status(:success)
		end 		
	end

	describe " GET index" do  

		it "assigns all users as @users" do   
			user = create(:user)
			get :index, {}
			expect(assigns(:users)).to eq([user])   
		end 

		it "assigns all users as @users (valid_session)" do   
			user = create(:user)
			get :index, {}, valid_session     
			expect(assigns(:users)).to eq([user])   
		end 

		it " check that @users has the proper number of users" do 
			user = create(:user)
			user2 = create(:user2)
			get :index, {}
			expect(User.all.count).to eq(2)
		end

		it " check that page loads successfully if no users" do 
			get :index, {}
			expect(response).to have_http_status(:success)
		end
			
	end

	describe " GET show" do  
		context " logged in user" do
			it " assigns the requested user as @user" do 
				user = create(:user)
				get :show, {id: 1}, valid_session
				expect(assigns(:user)).to eq(user)
			end
			it " check that page loads successfully" do 
				user = create(:user)
				get :show, {id: 1}, valid_session
				expect(response).to have_http_status(:success)
			end
			it " cards are populated" do 
				user = create(:user)
				card = create(:card)
				get :show, {id: 1}, valid_session
				expect(assigns(:cards)).to eq([card])   				
			end
			it "shared cards are populated" do 
				user = create(:user)
				user2 = create(:user2)
				card = create(:card)
				user2.cards << card
				# must reload to catch the database changes
				user2.reload
				get :show, {id: 1}, valid_session
				expect(assigns(:sharedCards).last.card_id).to eq(card.id)   				
			end
		end

		context " no logged in user" do
			it " assigns the requested user as @user (no valid session)" do 
				user = create(:user)
				get :show, {id: 1}
				expect(assigns(:user)).to eq(user)
			end
			it " check that page loads successfully (no valid_session)" do 
				user = create(:user)
				get :show, {id: 1}
				expect(response).to have_http_status(:success)
			end

			it " cards aren't populated (no valid session)" do 
				get :show, {id: 1}
				expect(assigns(:cards)).to be(nil)  
			end
			it "shared cards aren't populated" do 
				user = create(:user)
				user2 = create(:user2)
				card = create(:card)
				user2.cards << card
				# must reload to catch the database changes
				user2.reload
				get :show, {id: 1}
				expect(assigns(:sharedCards)).to be(nil)  
			end
		end

	end


end