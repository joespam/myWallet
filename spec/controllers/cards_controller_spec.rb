require 'rails_helper'

RSpec.describe CardsController, :type => :controller do

	let(:valid_session) { {user_id: 1} }

	describe " POST create" do
		
		it " check that @card is an instance of Card" do 
			user = create(:user)
			card = create(:card)
			session[:user_id] = 1
			post :create, {user_id: 1, card: attributes_for(:card)}
			expect(assigns(:card)).to be_an_instance_of(Card)
		end

		it " check that page is redirected to user" do 
			user = create(:user)
			session[:user_id] = 1
			post :create, {user_id: 1, card: attributes_for(:card)}
			expect(response).to redirect_to user_path 1
		end 	

		context "card failure" do
			it " card not created" do
				user = create(:user)
				session[:user_id] = 1			
				post :create, {user_id: 1, card: attributes_for(:card_bad)}
				expect(response).to redirect_to new_user_card_path 1
			end
		end

	end
	describe " DELETE destroy" do

		it " check that @card has been destroyed" do 
			#set up presets to enable page to work
			user = create(:user)
			card = create(:card)
			card.user_id = user.id
			delete :destroy, {user_id: 1, id: 1}, valid_session
			expect(Card.all).to eq([])
		end

		it " confirm @card delete redirect" do 
			#set up presets to enable page to work
			user = create(:user)
			card = create(:card)
			card.user_id = user.id
			delete :destroy, {user_id: 1, id: 1}, valid_session
			expect(response).to redirect_to user_path 1
		end

	end
	describe " GET new" do

		it " check that @card is an instance of card" do 
			#set up presets to enable page to work
			card = build(:card)
			get :new, {user_id: 1}, valid_session
			expect(assigns(:card)).to be_an_instance_of(Card)
		end

		it " new page loads successfully" do 
			# get the 'new' action with no params
			get :new, {user_id: 1}, valid_session
			# verify page loaded
			expect(response).to have_http_status(:success)
		end 	

	end	
	describe " GET share" do

		it " check that sharing form page loads" do 
			#set up presets to enable page to work
			user1 = create(:user)
			user2 = create(:user, email: 'user2@gmail.com')
			card = create(:card)
			card.user_id = user1.id
			get :share, {id: 1}, valid_session
			# verify page loaded
			expect(response).to have_http_status(:success)
		end

	end
	describe " POST complete_share" do

		it " check that sharing works as expected" do 
			#set up presets to enable page to work
			user1 = create(:user)
			user2 = create(:user2)
			card = create(:card)
			card.user_id = user1.id
			post :complete_share, {id: 1, user_email: user2.email}, valid_session
			expect(user2.cards.length).to eq(1)
		end

		it " check that successful sharing redirects" do 
			#set up presets to enable page to work
			user1 = create(:user)
			user2 = create(:user2)
			card = create(:card)
			card.user_id = user1.id
			post :complete_share, {id: 1, user_email: user2.email}, valid_session
			# verify it redirects to the sharee's path
			expect(response).to redirect_to user_path 2
		end

	end
	describe " GET unshare" do

		it " check that unsharing works as expected" do 
			# set up presets to enable page to work
			user1 = create(:user)
			user2 = create(:user, email: 'user2@gmail.com')
			card = create(:card)
			card.user_id = user1.id
			user2.cards << card
			post :unshare, {user_id: 2, card_id: 1}, valid_session
			# must do a reload to ensure new database state is
			# updated to the data structure
			user2.reload
			expect(user2.cards.length).to eq(0)
		end
		
		it " check that unsharing redirects when complete" do 
			# set up presets to enable page to work
			user1 = create(:user)
			user2 = create(:user, email: 'user2@gmail.com')
			card = create(:card)
			card.user_id = user1.id
			user2.cards << card
			post :unshare, {user_id: 2, card_id: 1}, valid_session
			# must do a reload to ensure new database state is
			# updated to the data structure
			user2.reload
			expect(response).to redirect_to user_path 2
		end

		it " verifying unshare failure" do 
			# set up presets to enable page to work
			user1 = create(:user)
			user2 = create(:user, email: 'user2@gmail.com')
			card = create(:card)
			bogus_card = create(:card)
			card.user_id = user1.id
			user2.cards << card
			post :unshare, {user_id: 2, card_id: 2}, valid_session
			# reloading even though nothing should have changed
			user2.reload
			# expect that user2 still has their shared card
			expect(user2.cards.length).to eq(1)
		end

	end
	describe " GET allcards" do 

		it " all cards page loads successfully" do 
			# get the 'new' action with no params
			get :allcards, {}, valid_session
			# verify page loaded
			expect(response).to have_http_status(:success)
		end 	

		it "assigns all cards as @cards" do   
			card = create(:card)
			get :allcards, {}
			expect(assigns(:cards)).to eq([card])   
		end 	

	end

end