class Sett < ActiveRecord::Base
  belongs_to :match

  def winner
    return nil unless winner_id
    match.players.where(id: winner_id).first
  end

  def set_winner(player)
    winner_id = player.id
    self.save
  end

end
