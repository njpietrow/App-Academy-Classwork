class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :user_id, null: false, index: {unique: false}
      t.integer :answer_choice_id, null: false, index: {unique: false}
      t.timestamps
    end
  end
end
