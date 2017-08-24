class SearchController < ApplicationController

	def name_search

		@college_results = College.where("name LIKE ?", "%#{params[:name]}%")
		
		if @college_results == nil
			flash[:message] = "No entries could be found. Refine your search and try again."
			redirect_to '/'
		end
	end

	def user_search
		# binding.pry

		@arr = []
		College.all.each do |c|
			if params[:in_state] == "1"
				if c.state == current_user.state && c.programs.include?(current_user.program) 
					if current_user.sat_score != nil && c.sat_score <= current_user.sat_score
						@arr << c
					else current_user.act_avg != nil && c.act_avg <= current_user.act_avg
						@arr << c
					end
				end
			else
				if c.programs.include?(current_user.program)
					@arr << c
				end
			end
			@arr
		end
	end

end

