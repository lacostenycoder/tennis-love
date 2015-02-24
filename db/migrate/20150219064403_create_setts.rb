class CreateSetts < ActiveRecord::Migration
  def change
    create_table :setts do |t|
      t.string :format
      t.integer :p1_games
      t.integer :p2_games
      t.integer :winner_id
      t.boolean :tie_break, default: false
      t.references :match, index: true

      t.timestamps null: false
    end
    add_foreign_key :sets, :matches
  end
end
