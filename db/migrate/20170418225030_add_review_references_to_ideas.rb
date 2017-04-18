class AddReviewReferencesToIdeas < ActiveRecord::Migration[5.0]
  def change
    add_reference :ideas, :review, foreign_key: true
  end
end
