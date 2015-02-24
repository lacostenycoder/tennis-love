class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :winner_id
      t.datetime :datetime
      t.references :league, index: true

      t.timestamps null: false
    end
    add_foreign_key :matches, :leagues
  end
end
