class AddActiveRecordQuestionsAnswersAssociation < ActiveRecord::Migration[7.0]
  def change
    add_reference :active_record_questions, :active_record_answers, foreign_key: true
    add_reference :active_record_answers, :active_record_question, foreign_key: true
  end
end
