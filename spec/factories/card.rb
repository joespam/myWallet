FactoryGirl.define do
   factory :card_no_user do
   	number 378282246310005
   	cardtype "AMEX"
   	expire_month 3
   	expire_year 2020
   	balance 1000000
   end

 	factory :card, class: Card do
   	number 4012888888881881
   	cardtype "VISA"
   	expire_month 12
   	expire_year 2017
   	balance 20
   	user_id 1
	end

   factory :card2, class: Card do
      number 378282246310005
      cardtype "AMEX"
      expire_month 3
      expire_year 2020
      balance 1000000
      user_id 2
   end

 	factory :card_bad, class: Card do
   	number 4012888888881881
   	cardtype "VISA"
   	expire_month nil
   	expire_year 2017
   	balance 20
   	user_id 1
	end
end