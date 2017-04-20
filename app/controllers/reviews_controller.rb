class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :edit, :update]
  def create
    @idea = Idea.find(params[:idea_id])
    review_params = params.require(:review).permit(:body)
    @review = Review.new(review_params)
    @review.idea = @idea
    @review.user = current_user

    # @review = @idea.reviews.build(review_params)
    if @review.save
      redirect_to idea_path(@idea), notice: 'Review Created!'
    else
      # redirect_to idea_path(@idea), alert: "Couldn't Create Review!"
		render '/ideas/show'
    end
  end

  def edit
    redirect_to root_path, alert: 'access denied' unless can_edit_review?(@review)
  end

  def update
    @review = Review.find(params[:id])
    review_params = params.require(:review).permit([:title, :body])

    if !(can? :edit, @review)
      redirect_to root_path, alert: 'Cannot update review; access denied'
    elsif @review.update(review_params)
      redirect_to review_path(@review),
      notice: 'Review updated'
    else
      render :edit
    end
  end

  def destroy
    @idea = Idea.find(params[:idea_id])
    @review = Review.find(params[:id])
    # review.destroy

    # local variable because only redirecting
    # only need instance variables if sharing with a template
    if can? :destroy, @review
      @review.destroy
      redirect_to idea_path(@idea), notice: 'Review deleted'
    else
      redirect_to root_path, alert: 'access denied'
    end
    # render plain: 'in ideas destroy'
  end

  # def destroy
  #   review = Review.find(params[:id])
  #   idea = review.idea
  #   review.destroy
  #   redirect_to idea_path(idea), notice: 'Review deleted!'
  # end

  private
   def find_idea
     @idea = Idea.find params[:id]
   end

   def idea_params
     params.require(:idea).permit([:title, :body, :name])
   end
end
