class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :body, index: true
      t.references :idea, foreign_key: true

      t.timestamps
    end
  end
end
