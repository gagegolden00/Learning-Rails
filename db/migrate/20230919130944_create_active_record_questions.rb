class CreateActiveRecordQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :active_record_questions do |t|
      t.text :question, null: false
      t.timestamps
    end
  end
end
