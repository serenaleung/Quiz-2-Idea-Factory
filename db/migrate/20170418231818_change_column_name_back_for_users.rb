class ChangeColumnNameBackForUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :user_id, :first_name
  end
end
