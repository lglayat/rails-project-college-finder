class User < ApplicationRecord
	has_many :reviews
	has_many :colleges, through: :watchlists    
	has_many :watchlists
	belongs_to :program
	has_secure_password
end
