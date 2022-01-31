class UsernameNull < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :username, :string, null: false, index: {unique: true}
  end
end
