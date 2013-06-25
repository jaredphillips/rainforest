require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	setup do
		@product = FactoryGirl.create(:product)
	end

	test "must have name" do
		@product.name = ""
		refute @product.valid?
	end

	test "must have description" do
		@product.description = ""
		refute @product.valid?
	end

	test "must have price" do
		@product.price = ""
		refute @product.valid?
	end

	test "price must be decimal" do
		@product.price = 1040.32
		assert_kind_of BigDecimal, @product.price
	end
end