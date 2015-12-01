require 'rails_helper'

RSpec.describe CardsController, :type => :controller do

	let(:valid_session) { {user_id: 1} }

	describe " POST create" do
		# it " check that @card is an instance of Card" do 
		# 	user = create(:user)
		# 	card = create(:card)
		# 	session[:user_id] = 1
		# 	post :create, {user_id: 1, card: attributes_for(:card)}
		# 	expect(assigns(:card)).to be_an_instance_of(Card)
		# end

		# it " check that @card.users has one user" do 
		# 	user = create(:user)
		# 	card = create(:card)
		# 	session[:user_id] = 1
		# 	post :create, {user_id: 1, card: attributes_for(:card)}
		# 	expect(assigns(:card).users.length).to eq(1)						
		# end

		# it " check that @card.users has one user" do 
		# 	user = create(:user)
		# 	card = create(:card)
		# 	session[:user_id] = 1
		# 	post :create, {user_id: 1, card: attributes_for(:card)}
		# 	expect(assigns(:card).users.first).to eq(user)						
		# end

		# it " check that page is redirected to user" do 
		# 	user = create(:user)
		# 	# card = create(:card)
		# 	session[:user_id] = 1
		# 	post :create, {user_id: 1, card: attributes_for(:card)}
		# 	expect(response).to redirect_to user_path 1
		# end 	

		context "card failure" do
			it " card not created" do
				user = create(:user)
				# card = build(:card)
				session[:user_id] = 1			
				post :create, {user_id: 1, card: attributes_for(:card_bad)}
				expect(response).to have_http_status(:failure)
				# expect(response).to redirect_to new_user_card_path 1
			end
		end
	end
	describe " GET destroy" do
	end
	describe " GET new" do
		# it " check that @card is an instance of card" do 
		# 	#set up presets to enable page to work
		# 	card = build(:card)

		# 	get :new, {user_id: 1}, valid_session
		# 	expect(assigns(:card)).to be_an_instance_of(Card)
		# end

		# it " new page loads successfully" do 
		# 	# get the 'new' action with no params
		# 	get :new, {user_id: 1}, valid_session
		# 	# verify page loaded
		# 	expect(response).to have_http_status(:success)
		# end 		
	end	
	describe " GET share" do
	end
	describe " GET complete_share" do
	end
	describe " GET unshare" do
	end
end