class AddArgumentsToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :active_record_answers, :arguments, :string
  end
end
