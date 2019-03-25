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

    @review.save

    if @review.save
      redirect_to "/products/" + params[:product_id], notice: 'Review created!'
    else
      render "/products/" + params[:product_id]
    end
  end
end
