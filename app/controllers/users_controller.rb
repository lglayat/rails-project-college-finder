class UsersController < ApplicationController
	before_action :check_if_logged_in, only: [:show]
	
	def new
		@user = User.new
	end


	def show
		@user = User.find(params[:id])
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

	def edit 
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)

		redirect_to user_path(@user)
	end

	def add_to_watchlist
		@college = College.find_by(id: params[:college_id]) 
		
		if current_user.colleges.include?(@college)
			flash[:message] = "College already on your list!"
		else
			current_user.colleges << @college
		end
			
		redirect_to user_path(current_user)

	end

	def delete_watchlist
		binding.pry

	end



	private

	def user_params
		params.require(:user).permit(:username, :password, :program_id, :sat_score, :act_avg, :state)
	end

end
