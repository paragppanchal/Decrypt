class DropInstalls < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :user_id
    drop_table :users
  end
end
