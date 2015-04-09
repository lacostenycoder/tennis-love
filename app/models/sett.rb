class Sett < ActiveRecord::Base
  # create_table "setts", force: :cascade do |t|
  #   t.string   "format"
  #   t.integer  "p1_games"
  #   t.integer  "p2_games"
  #   t.boolean  "tie_break"
  #   t.integer  "winner_id"
  #   t.integer  "match_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end
  belongs_to :match

  def winner
    return nil unless winner_id
    match.players.where(id: winner_id).first
  end

  def set_winner(player)
    winner_id = player.id
    self.save
  end

  def score
    hash = {
      :p1 => p1_games,
      :p2 => p2_games,
      :winner => winner_id,
      :tie_break => tie_break
      }
  end

end
