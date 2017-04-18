class ReviewsController < ApplicationController
  def create
    @idea = Idea.find(params[:idea_id])
    review_params = params.require(:review).permit(:body)
    @review = Review.new(review_params)
    @review.idea = @idea

    # @review = @idea.reviews.build(review_params)
    if @review.save
      redirect_to idea_path(@idea), notice: 'Review Created!'
    else
      # redirect_to idea_path(@idea), alert: "Couldn't Create Review!"
		render '/ideas/show'
    end
  end

  def destroy
  end
end
