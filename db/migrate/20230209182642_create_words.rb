class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.string :origin
      t.string :translation
      t.integer :proficiency, default: 0
      t.string :language, default: 'en'
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
