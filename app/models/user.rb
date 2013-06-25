class User < ActiveRecord::Base
	has_secure_password

	has_many :reviews
	has_many :products, through: :reviews

	validates :password,
		presence: true,
		length: { minimum: 6 },
		confirmation: { if: :validate_password? }

	private

	def validate_password?
		password.present? || password_confirmation.present?
	end
end
