class User < ActiveRecord::Base
	has_many :cards

	validates :email, presence: true, uniqueness: true
	validates :password, confirmation: true, presence: true, length: {minimum: 4, maximum: 15}
	validates_presence_of :phone
	validates_presence_of :fname
	validates_presence_of :lname

end
