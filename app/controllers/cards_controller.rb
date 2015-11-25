require 'pp'


class CardsController < ApplicationController
	def complete_share
		values = params[:user_shared_card]
		user_email = values[:user_id].strip
		user = User.find_by_email user_email
		puts "about to create a join record with user #{user.id} and card #{values[:card_id]}"
		shared = UserSharedCard.create(:user_id => user.id, :card_id => values[:card_id])
		if shared
			flash[:notice] = "Card shared successfully."
			shared.save
		else
			flash[:alert] = "There was a problem sharing the Card."
		end
		redirect_to user_path user.id
	end
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
		@share = UserSharedCard.new
	end

	private
	def user_params
		params.require(:card).permit(:number, :expire_month, :expire_year, :balance, :cardtype, :user_id)
	end
end