class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :playoffs
      t.references :league, index: true

      t.timestamps null: false
    end
    add_foreign_key :seasons, :leagues
  end
  
end
