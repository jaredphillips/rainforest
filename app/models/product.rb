class Product < ActiveRecord::Base
	validates :name, :description,
		presence: true
	
	validates :price,
		presence: true,
		numericality: true

	has_many :reviews
	has_many :users, through: :reviews
end
