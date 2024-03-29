class CreateAnswerChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_choices do |t|
      t.integer :question_id, null: false, index: {unique: false}
      t.text :answer_text, null: false
      t.timestamps
    end
  end
end
