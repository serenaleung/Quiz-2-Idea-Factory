class Idea < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user, optional: true
  validates :body, presence: true


  # def edit
  #   redirect_to root_path, alert: 'access denied' unless can_edit_idea?(@idea)
  # end
end
