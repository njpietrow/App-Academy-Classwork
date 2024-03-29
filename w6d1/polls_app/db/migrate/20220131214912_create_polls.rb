class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.integer :author_id, null: false, index: {unique: false}
      t.string :title, null: false, index: {unique: false}
      t.timestamps
    end
  end
end
