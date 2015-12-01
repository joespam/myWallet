class UsersController < ApplicationController

	def index
		@users = User.all
		if @users.present?
			flash.now[:notice] = "Users display successfully."
		else
			flash.now[:alert] = "Sorry, there were no users to display."
		end
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find_by_id params[:id]
		if current_user
			@cards = []
			allCards = Card.all
			allCards.each do |card|
				@cards << card if card.user_id == current_user.id
			end
		end
	end 
	
	private
		def user_params
			params.require(:user).permit(:fname, :lname, :username, :password, :email)
		end
end