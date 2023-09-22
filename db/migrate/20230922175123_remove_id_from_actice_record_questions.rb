class RemoveIdFromActiceRecordQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_reference :active_record_questions, :active_record_answers, index: true
  end
end
