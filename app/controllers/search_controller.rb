class SearchController < ApplicationController

	def name_search

		@college_results = College.where("name LIKE ?", "%#{params[:name]}%")
		
		if @college_results == nil
			flash[:message] = "No entries could be found. Refine your search and try again."
			redirect_to '/'
		end
	end

	def user_search

	end

end

