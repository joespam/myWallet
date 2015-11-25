
class CardsController < ApplicationController
	def create
		@card = Card.create(user_params)
		if @card
			@card.user_id = current_user.id
			@card.save
			redirect_to user_path current_user.id
		else 
			flash[:alert] = "Card not created, please try again."
			redirect_to new_user_card_path(current_user.id)
		end
	end
	def destroy
		card = Card.find_by_id params[:id]

		if card.destroy
		 flash[:notice] = "Card deleted successfully."
		else
		 flash[:alert] = "There was a problem deleting the Card."
		end
		redirect_to user_path current_user.id
	end
	def new
		@card = Card.new
		@card.user_id = current_user.id
	end
	def share
		@card = Card.find_by_id params[:id]
		@users = User.all
	end

	private
	def user_params
		params.require(:card).permit(:number, :expire_month, :expire_year, :balance, :cardtype, :user_id)
	end
end