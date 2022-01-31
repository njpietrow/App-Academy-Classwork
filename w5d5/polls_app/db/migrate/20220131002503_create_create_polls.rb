class CreateCreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :create_polls do |t|
      t.string :title, null: false, index: {unique: true}
      t.integer :author_id, null: false, index: {unique: true}
      
      t.timestamps
    end
  end
end
