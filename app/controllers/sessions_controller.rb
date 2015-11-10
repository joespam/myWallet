class SessionsController < ApplicationController

	def create
		@user = User.where(email: params[:email]).first

		# Now check for user password
		#
		if @user && @user.password == params[:password]
			session[:user_id] = @user.id
			current_user
			flash[:notice] = "You have logged in successfully."
			redirect_to '/'
		else 
			flash[:alert] = "invalid user name or email #{params[:email]}"
			redirect_to login_path
		end
	end

	#route for logging out a user
	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have logged out."
		redirect_to '/'
	end

	#route for login form
	def new
		flash[:notice] = ""
		flash[:alert] = ""
		@login = ""
	end

end