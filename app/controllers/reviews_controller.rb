class ReviewsController < ApplicationController
	before_filter :require_login

	def create
	  @review = Review.new(review_params)
	  @review.product_id = params[:product_id]
	  @review.user = current_user

	  if @review.save
		  redirect_to product_path(@review.product)
		else
		  redirect_to @review.product
		end
	end

	private

	def require_login
    unless current_user
      flash[:error] = "You must be logged in to create reviews"
      redirect_to login_path
    end
  end

	def review_params
	  params.require(:review).permit(:description, :rating)
	end

end


