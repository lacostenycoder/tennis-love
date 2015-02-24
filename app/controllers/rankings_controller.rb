class RankingsController < ApplicationController
  def index
    @users = User.all
    @matches = Match.all
  end
end
