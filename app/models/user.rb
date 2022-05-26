class User < ApplicationRecord
	before_save { 
		name.capitalize!
		email.downcase! 
	}
	validates :name,  
				presence: 		true, 
				length: 		{ maximum:  50 }

	VALID_EMAIL_REGEX = /\A[\w.]+@[a-z\d]+(\.[a-z\d]+)*[a-z]+\z/i
	validates :email, 
				presence: 		true,
				length: 		{ maximum: 			250 },
				format: 		{ with: 			VALID_EMAIL_REGEX },
				uniqueness: 	{ case_sensitive: 	false }
	
	has_secure_password 
	# password_confirmation
	validates :password,
				length: 		{ minimum: 			6}
end
