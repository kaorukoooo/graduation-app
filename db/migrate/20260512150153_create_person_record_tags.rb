class CreatePersonRecordTags < ActiveRecord::Migration[7.2]
  def change
    create_table :person_record_tags do |t|
      t.references :person_record, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
