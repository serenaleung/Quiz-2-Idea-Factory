class IdeasController < ApplicationController
  # before_action :find_idea, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :authenticate_user!, only: [:create, :destroy]

  def index
    @ideas = Idea.all
    @idea = Idea.new
  end

  def new
    @idea = Idea.new
  end

  def show
    @idea = Idea.find params[:id]
    @review = Review.new
    # @idea.user = current_user

  end


  def create
      idea_params = params.require(:idea).permit([:title, :body])
      @idea = Idea.new idea_params
      @idea.user = current_user

      if @idea.save
        flash[:notice] = "Idea created"
        redirect_to idea_path(@idea)
      else
        flash[:alert] = "Idea not created"
        render :new
      end
  end

  def edit
    # redirect_to root_path, alert: 'Cannot edit idea; access denied'
    #   unless can_edit_idea?(@idea)
    #   end
    @idea = Idea.find params[:id]
    redirect_to root_path, alert: 'access denied' unless can? :edit, @idea
  end

  def update
    @idea = Idea.find(params[:id])
    idea_params = params.require(:idea).permit([:title, :body])

    if !(can? :edit, @idea)
      redirect_to root_path, alert: 'Cannot update idea; access denied'
    elsif @idea.update(idea_params)
      redirect_to idea_path(@idea),
      notice: 'Idea updated'
    else
      render :edit
    end
  end

  def destroy
    @idea = Idea.find params[:id]
    # idea.destroy

    # local variable because only redirecting
    # only need instance variables if sharing with a template
    if can? :destroy, @idea
      @idea.destroy
      redirect_to ideas_path, notice: 'Idea deleted'
    else
      redirect_to root_path, alert: 'access denied'
    end
    # render plain: 'in ideas destroy'
  end
end
