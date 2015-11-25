class User_shared_cards < ActiveRecord::Base
	belongs_to :user
	belongs_to :card
	
	validates_presence_of :user_id
	validates_presence_of :card_id
end