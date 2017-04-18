class AddColumnUserIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :user_id, :string
  end
end
