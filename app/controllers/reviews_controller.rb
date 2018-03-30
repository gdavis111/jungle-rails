class ReviewsController < ApplicationController

  def create
    # raise "Yay, I'm here!"

    @review = Review.new(review_params)

    #is this the right place? --- not working
    @review.user = current_user
    @review.product_id = params[:product_id]
    if @review.save
      redirect_to product_path(@review.product), notice: "Review created!"
    else
      redirect_to product_path(@review.product_id), notice: "Failed to create review."
    end

  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
