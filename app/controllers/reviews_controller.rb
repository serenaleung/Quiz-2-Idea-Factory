class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
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

  private
   def find_idea
     @idea = Idea.find params[:id]
   end

   def idea_params
     params.require(:idea).permit([:title, :body, :name])
   end
end
