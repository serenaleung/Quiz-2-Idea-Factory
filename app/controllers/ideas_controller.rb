class IdeasController < ApplicationController

  # before_action :authenticate_user!, only: [:create, :destroy]

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def show
    @idea = Idea.find params[:id]
  end

  def create
      idea_params = params.require(:idea).permit([:title, :body, :name])
      @idea = Idea.new idea_params
      # @idea.user = current_user

      if @idea.save
        redirect_to idea_path(@idea)
      else
        render :new
      end
  end

  def destroy
    idea = Comment.find(params[:id])
    idea.destroy
    redirect_to idea_path(idea), notice: 'Comment deleted!'
  end
end
