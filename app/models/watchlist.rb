class Watchlist < ApplicationRecord
	belongs_to :user
	belongs_to :college

	validates :college_id, :user_id, uniqueness: true
end
