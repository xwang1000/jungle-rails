class ReviewsController < ApplicationController
  def show
  end

  def create
    review_input = params[:review]
    @review = Review.new
    @review.product_id = params[:product_id]
    @review.rating = review_input[:rating]
    @review.description = review_input[:description]
    @review.user_id = current_user.id

    if @review.save
      redirect_to @review.product, notice: 'Review created!'
    else
      redirect_to @review.product, notice: 'Review failed to create.'
    end
  end
end
