class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :poll_id, null: false, index: {unique: false}
      t.text :text, null: false
      t.timestamps
    end
  end
end
