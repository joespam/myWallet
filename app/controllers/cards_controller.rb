require 'pp'


class CardsController < ApplicationController
	# before_action :current_user
	def allcards
		@cards = Card.all
		if @cards.present?
			flash.now[:notice] = "Cards display successfully."
		else
			flash.now[:alert] = "Sorry, there are no cards to display."
		end
	end
	def assigncards
		user = User.find params[:user_id]
		card = Card.find params[:card_id]
		if user && card
			user.cards << card
			flash.now[:notice] = "Card shared successfully."
		else
			flash.now[:alert] = "There was a problem sharing the Card. Please verify user email."
		end
		redirect_to user_path user.id
	end
	def complete_share
		user_email = params[:user_email].strip
		user = User.find_by_email user_email	
		card = Card.find params[:card_id]
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
			@card.user_id = current_user.id
			# @card.users << current_user
			# @card.save
			redirect_to user_path current_user.id
		else 
			flash.now[:alert] = "Card not created, please try again."
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
	end
	def share
		@card = Card.find_by_id params[:id]
		@users = User.all
	end
	def unshare
		user = User.find params[:user_id]
		card = Card.find params[:card_id]
		if user && card
			user.cards.delete(card)
			flash[:notice] = "Card unshared successfully."
		else
			flash[:alert] = "There was a problem sharing the Card. Please verify user email."
		end
		redirect_to user_path user.id
	end

	private
	def card_params
		params.require(:card).permit(:number, :expire_month, :expire_year, :balance, :cardtype, :user_id)
	end
end