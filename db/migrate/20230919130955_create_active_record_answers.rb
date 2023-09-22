class CreateActiveRecordAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :active_record_answers do |t|
      t.string :method, null: false
      t.text :example, null: false
      t.timestamps
    end
  end
end
