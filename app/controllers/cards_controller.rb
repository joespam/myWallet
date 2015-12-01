require 'pp'


class CardsController < ApplicationController
	# before_action :current_user

	def complete_share
		values = params[:user_shared_card]
		user_email = values[:user_id].strip
		user = User.find_by_email user_email
		card = Card.find_by_id values[:card_id]
		if user && card
			user.cards << card
			flash.now[:notice] = "Card shared successfully."
		else
			flash.now[:alert] = "There was a problem sharing the Card. Please verify user email."
		end
		redirect_to user_path user.id
	end
	def create
		@card = Card.new(card_params)
		if @card.save
			# the below line is bogus - there should not be a 
			# user_id field in cards in this exercise
			#
			@card.user_id = current_user.id
			# the below line is how we put a card on the user
			# the above line will be removed once the database
			# is redesigned
			#
			@card.users << current_user
			@card.save
			redirect_to user_path current_user.id
		else 
			flash.now[:alert] = "Card not created, please try again."
			redirect_to new_user_card_path(current_user.id)
		end
	end
	def destroy
		card = Card.find_by_id params[:id]

		if card.destroy
		 flash.now[:notice].now = "Card deleted successfully."
		else
		 flash.now[:alert] = "There was a problem deleting the Card."
		end
		redirect_to user_path current_user.id
	end
	def new
		@card = Card.new
		# @card.user_id = current_user.id
	end
	def share
		@card = Card.find_by_id params[:id]
		@users = User.all
	end
	def unshare
	end

	private
	def card_params
		params.require(:card).permit(:number, :expire_month, :expire_year, :balance, :cardtype, :user_id)
	end
end