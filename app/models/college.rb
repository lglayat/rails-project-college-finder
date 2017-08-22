class College < ApplicationRecord
	has_many :users, through: :watchlists
	has_many :watchlists
	has_many :reviews
	has_many :programs
end
