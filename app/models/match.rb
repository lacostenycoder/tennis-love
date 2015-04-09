class Match < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :setts
  #has_one :winner
  belongs_to :league

  #default_scope where(:league => true)
  #before_save :save_score

  def players
    users
  end

  def winner
    User.find(self.winner_id)
  end

  def player_one
    self.users.first
  end

  def player_two
    self.users.last
  end

  def score
    sets = []
    setts.each do |sett|
      sets << sett.score
    end
    sets
  end

  def format_score
    str = ""
    sets = score
    count = 0
    sets.each do |set|
      str += "#{set[:p1]}-#{set[:p2]}"
      count += 1
      str += ', ' unless count >= sets.length
    end
    str
  end

  def update(params)
    #binding.pry
  end

  def save_score(params)
    # self.set_one = params["set_1"].map{|s1| s1.last}.join('-')
    # self.set_two = params["set_2"].map{|s2| s2.last}.join('-')
    # self.set_three = params["set_3"].map{|s3| s3.last}.join('-')
  end

  def win
  end

  def set_complete(sett)
    score = [sett[0].to_i, sett[2].to_i]
    if score[0] >= 6 && score[0] > score[1]
      true
    elsif score.each{|s| s < 6 } && self.set_two == "0-0"
      true
    else
      false
    end
  end

  def match_win
  end

end
