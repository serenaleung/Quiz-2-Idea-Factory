class Idea < ApplicationRecord
  has_many :reviews
  belongs_to :user, optional: true
end
