class CreateMovie < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.integer :blockbuster_id
      t.string :genre
      t.integer :release_year
      t.boolean :restricted

      t.timestamps
    end
  end
end
