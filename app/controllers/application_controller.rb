class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :click, only: :index

  def authenticate_user!
  if !user_signed_in?
    redirect_to new_session_path, notice: "You must be signed in!"
  end
  # unless user_signed_in?
  #   flash[:notice] = "Please sign in"
  #   redirect_to new_session_path
  # end



end
helper_method :authenticate_user!

def user_signed_in?
  current_user.present?
end
helper_method :user_signed_in?

def current_user
  @current_user ||= User.find_by_id(session[:user_id])
end
helper_method :current_user

def can_edit_idea?(idea)
  user_signed_in? && (idea.user == current_user)
end
helper_method :can_edit_idea?

# def can_edit_review?(review)
#   user_signed_in? && (review.user == current_user)
# end
# helper_method :can_edit_review?

def index
  @clicks = Click.sum
 end

private

   def click
      Click.create
   end

end
