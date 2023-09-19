class CreateActiveRecordMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :active_record_methods do |t|

      t.timestamps
    end
  end
end
