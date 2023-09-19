class CreateActiveRecordAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :active_record_answers do |t|
      t.string :method_name, null: false
      t.string :method_description, null: false
      t.timestamps
    end
  end
end
