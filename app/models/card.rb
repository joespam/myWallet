class Card < ActiveRecord::Base
	has_many :users, :through => :user_shared_cards
	has_many :user_shared_cards

	months = [
		'Jan','Feb','Mar',
		'Apr','May','Jun',
		'Jul','Aug','Sep',
		'Oct','Nov','Dec'
	]

	validates_presence_of :balance
	validates_presence_of :number
	validates :expire_month, presence: true, length: {maximum: 2}
	validates :expire_year, presence: true, length: {maximum: 4}

	before_save :autofill_card_type

	# Determine the card type/bank from the first few digits
	#  of the submitted digits; assumed to be a CC # with
	# no whitespace
	#
	def autofill_card_type

		# get the card number
		#
		digits = self.number.to_s
		type = "unknown"
		#
		# check the credit card digits against known card types
		#
		if digits =~ /^4[0-9]{6,}$/ # Visa cards start with 4
			type = "VISA"
		elsif digits =~ /^5[1-5][0-9]{5,}$/ 
			# Mastercard CREDIT cards start with the digitss 51 through 55,
			# there are other mastercard types this will not detect
			#
			type = "MASTERCARD"
		elsif digits =~ /^3[47][0-9]{5,}$/ # AMEX starts with 34 or 37
			type = "AMEX"
		elsif digits =~ /^3(?:0[0-5]|[68][0-9])[0-9]{4,}$/ 
			# Diners Club card digitss begin with 300 through 305, 36 or 38.
			# there are other dinersclub cards with different characteristics,
			# I'm ignoring those for this exercise
			#
			type = "DINERSCLUB"
		elsif digits =~ /^6(?:011|5[0-9]{2})[0-9]{3,}$/
			# 
			# Discover card digitss begin with 6011 or 65.
			#
			type = "DISCOVER"
		elsif digits =~ /^(?:2131|1800|35[0-9]{3})[0-9]{3,}$/
			#
			# JCB cards begin with 2131, 1800 or 35.
			# 
			type = "JCB"
		else 
			# type - unknown?
			# flash error: "Card cannot be identified"
		end

		# set the card type
		#
		self.cardtype = type
	end
end
