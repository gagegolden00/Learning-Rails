class ChangeQuestionToText < ActiveRecord::Migration[7.0]
  def change
    rename_column :active_record_questions, :question, :question_text
  end
end
