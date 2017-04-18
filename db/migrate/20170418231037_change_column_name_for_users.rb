class ChangeColumnNameForUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :first_name, :user_id
  end
end
