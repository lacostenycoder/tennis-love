class League < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_many :seasons
  has_many :matches
  belongs_to :manager, class_name: 'User'

  def score_format
    'Open, Single Sets, winner with most games'
  end

  def current_season
    seasons.select{|s| s.start_date <= Time.now && s.end_date >= Time.now}.first
  end

  def current_season_matches
    matches.select do |m|
      m.datetime >= current_season.start_date && m.datetime <= current_season.end_date
    end
  end

  def rankings
    binding.pry
  end

  def players
    users
  end

  # def init
  #   @players = []
  # end

#   def players=(value)
#     @players = value
#     binding.pry
#   end
#
#   def players
#     get_players
#   end
#
#   def get_players
#     users.where(type: 'Player')
#   end
#
#   def add_players(*obj)
#     binding.pry
#     if obj.any?
#       return obj.each{|u| users << u}
#     end
#     return users.where(type: 'Player')
#   end

end
