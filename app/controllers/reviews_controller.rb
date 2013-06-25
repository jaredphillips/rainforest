class ReviewsController < ApplicationController
	before_filter :load_product
  before_filter :ensure_logged_in, only: [:show, :create, :edit, :update, :destroy]

  def show
  	@review = Review.find(params[:id])
  end

  def create
  	# @review = @product.reviews.build(review_params)

  	@review = Review.new(
  		comment: params[:review][:comment],
  		product_id: @product.id,
  		user_id: current_user.id
  	)

  	if @review.save
  		redirect_to @product, notice: "Review Created!"
  	else
  		render action: :show, notice: "Didn't save, please do again."
  	end
  end

  def edit
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  end

  private

  def load_product 
  	@product = Product.find(params[:product_id])
  end

  def review_params
  	params.require(:review).permit(:comment, :user_id, :product_id)
  end

end
