class CreateMovie < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.string :genre
      t.integer :release_year
      t.boolean :restricted
      t.references :blockbuster, foreign_key: true, null: false
      t.timestamps
    end
  end
end
