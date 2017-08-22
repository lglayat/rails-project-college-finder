class User < ApplicationRecord

	has_many :reviews
	has_many :colleges, through: :watchlists    
	has_many :watchlists

	has_secure_password
end
