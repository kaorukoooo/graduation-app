class CreateTags < ActiveRecord::Migration[7.2]
  def change
    create_table :tags do |t|
      t.references :user, null: true, foreign_key: true
      t.string :name, null: false
      t.string :tag_type, null: false
      t.string :sentiment, null: false

      t.timestamps
    end
  end
end
