class ChangeLike < ActiveRecord::Migration[5.2]
  def change
    rename_column :likes, :user, :user_id
  end
end
