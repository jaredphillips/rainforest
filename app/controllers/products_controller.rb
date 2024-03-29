class ProductsController < ApplicationController
  before_filter :ensure_logged_in, only: [:edit, :destroy]

  def index
  	@products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  	@review = @product.reviews.build
  end

  def new
  	@product = Product.new
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def create
  	@product = Product.new(product_params)

  	if @product.save
  		redirect_to products_url
  	else
  		render :new
  	end
  end
  
  def update
  	@product = Product.find(params[:id])

  	if @product.update_attributes(product_params)
  		redirect_to products_url
  	else
  		render :edit
  	end
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to products_url
  end

  private

  def product_params
  	params.require(:product).permit(:name, :description, :price)
  end
end
