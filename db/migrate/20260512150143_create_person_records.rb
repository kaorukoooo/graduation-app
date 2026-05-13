class CreatePersonRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :person_records do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nickname, null: false
      t.date :met_on
      t.text :good_points
      t.text :concerns

      t.timestamps
    end
  end
end
