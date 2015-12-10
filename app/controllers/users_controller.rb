class UsersController < ApplicationController

	def index
		@users = User.all
		if @users.present?
			flash[:notice] = "Users display successfully."
		else
			flash[:alert] = "Sorry, there were no users to display."
		end
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find_by_id params[:id]
		if current_user
			# @cards = @user.cards
			@cards = []
			@sharedCards = []
			allCards = Card.all
			allCards.each do |card|
				if card.user_id == current_user.id
					@cards << card 
					#
					# check if card is shared
					#
					shares = UserSharedCard.where(card_id: card.id)
					shares.each do |share|
						@sharedCards << share
					end
				end

			end
		end
	end 
	
	private
		def user_params
			params.require(:user).permit(:fname, :lname, :username, :password, :email)
		end
end