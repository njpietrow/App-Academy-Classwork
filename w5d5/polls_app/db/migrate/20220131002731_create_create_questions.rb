class CreateCreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :create_questions do |t|
      t.text :q
      t.timestamps
    end
  end
end
