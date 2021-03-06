class ReviewsController < ApplicationController

before_filter :authorize

  def create
    product = Product.find(params[:product_id])
    @review = product.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      puts 'Got it'
      redirect_to product_path(params[:product_id])
    else
      puts 'You got a problem'
      redirect_to product_path(params[:product_id])
    end
  end

  def review_params
    params.require(:review).permit(:product_id, :rating, :description)
  end

  def destroy
    @product = Product.find(params[:product_id])
    Review.find(params[:id]).destroy
    redirect_to product_path(params[:product_id])
  end

end
