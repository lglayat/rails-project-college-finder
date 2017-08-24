class Program < ApplicationRecord
	has_many :college_programs
	has_many :colleges, through: :college_programs
	has_many :user
end
