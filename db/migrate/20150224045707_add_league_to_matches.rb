class AddLeagueToMatches < ActiveRecord::Migration
  def change
    add_reference :matches, :league, index: true
    add_foreign_key :matches, :leagues
  end
end
