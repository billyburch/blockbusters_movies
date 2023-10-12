class CreateBlockbusters < ActiveRecord::Migration[7.0]
  def change
    create_table :blockbusters do |t|
      t.string :name
      t.string :city
      t.string :state
      t.integer :store_awards
      t.boolean :rewards_program

      t.timestamps
    end
  end
end
