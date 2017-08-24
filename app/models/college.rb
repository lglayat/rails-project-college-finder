class College < ApplicationRecord
	has_many :watchlists
	has_many :users, through: :watchlists
	has_many :college_programs
	has_many :programs, through: :college_programs
end
