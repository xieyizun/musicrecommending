class Buyer < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation
	has_secure_password

	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token

	validates :name, presence: true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\_.]+@[a-z\d\_.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
				uniqueness: {case_sensitive: false}
	validates :password, presence: true, length: {minimum: 6}
	validates :password_confirmation, presence: true

	has_many :orders, dependent: :destroy
	has_many :comments, dependent: :destroy
	
	private 
		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end
end
