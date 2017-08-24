class Watchlist < ApplicationRecord
	belongs_to :user
	belongs_to :college

	validates_uniqueness_of :college_id, :scope => [:user_id] 
end
