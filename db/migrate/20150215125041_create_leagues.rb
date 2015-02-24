class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.integer :manager_id
      t.timestamps null: false
    end
  end
end
