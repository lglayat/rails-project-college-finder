class User < ApplicationRecord
	has_many :watchlists
	has_many :colleges, through: :watchlists    
	belongs_to :program
	has_secure_password
end
