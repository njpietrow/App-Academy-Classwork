class ChangeQuestion < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :text, :question_text
  end
end
