class User < ActiveRecord::Base
	has_many :cards, :through => :user_shared_cards
	has_many :user_shared_cards

	validates :email, presence: true, uniqueness: true
	validates :password, confirmation: true, presence: true, length: {minimum: 4, maximum: 15}
	validates_presence_of :phone
	validates_presence_of :fname
	validates_presence_of :lname

end
