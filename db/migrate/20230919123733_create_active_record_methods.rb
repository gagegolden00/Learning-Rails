class CreateActiveRecordMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :active_record_methods do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end