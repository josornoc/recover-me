class User < ActiveRecord::Base

	# this is for checking the token to external forms to be able to change the database
  # skip_before_action :verify_authenticity_token

	has_secure_password

	validates :name, presence: true, length: { in: 2..75 }
	validates :email, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  has_many :items

end
