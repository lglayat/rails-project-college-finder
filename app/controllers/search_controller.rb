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
					if current_user.sat_score && c.sat_score <= current_user.sat_score
						@arr << c
					elsif current_user.act_avg && c.act_avg <= current_user.act_avg
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


	def advanced_search
		
	end

	def advanced_search_results
		@arr = []
		College.all.each do |c|
			if params[:state] == c.state 
				@program = Program.find(params[:program][:program_id])
				if c.programs.include?(@program)
					if params[:sat_score] != "" && c.sat_score <= params[:sat_score].to_i
						# binding.pry
						@arr << c
					elsif params[:act_avg] != "" && c.act_avg <= params[:act_avg].to_i
						@arr << c
					end
				end
			end
		end

			if @arr.length == 0
				flash[:message]= "No College with those criteria. Please refine search."
			redirect_to "/advanced_search"
			end
		@arr
	end
end

