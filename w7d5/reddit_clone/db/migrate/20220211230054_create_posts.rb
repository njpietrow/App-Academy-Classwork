class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.string :content
      t.integer :sub_id, null: false, index: true
      t.integer :author_id, null: false, index: true

      t.timestamps
    end
  end
end
