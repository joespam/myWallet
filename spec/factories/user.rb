FactoryGirl.define do
	factory :user do
		email "tuser@gmail.com"
		password "12345678"
		phone "610 555 1212"
		fname "Test"
		lname "User"
	end

	factory :user2, class: User do
		email "bjoe@gmail.com"
		password "12345678"
		phone "610 666 666"
		fname "Bobby Joe"
		lname "Probert"
	end

	factory :user_bad_pw, class: User do
		email "tuser@gmail.com"
		password "11111111"
		phone "610 555 1212"
		fname "Test"
		lname "User"
	end
	# for future tests where we can validate email
	factory :user_bad_email, class: User do
		email "not_registered@gmail.com"
		password "11111111"
		phone "610 555 1212"
		fname "Test"
		lname "User"
	end	

end