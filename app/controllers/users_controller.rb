class UsersController < ApplicationController
	before_action :check_if_logged_in, only: [:show]
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			redirect_to "/sign_up"
		end
	end

	def show
		@user = User.find(params[:id])
	end


	private

	def user_params
		params.require(:user).permit(:username, :password, :major, :sat_score, :act_avg)
	end

end