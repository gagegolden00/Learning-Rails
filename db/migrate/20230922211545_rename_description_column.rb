class RenameDescriptionColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :active_record_answers, :description, :example
  end
end
