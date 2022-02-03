class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :commenter_id, null: false, index: true
      t.integer :commented_artwork_id, null: false, index: true
      t.timestamps
    end
  end
end
