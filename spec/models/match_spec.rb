require 'rails_helper'

RSpec.describe Match, :type => :model do
  describe "MATCH SCORE" do
    it "should have a score method" do
      match = Match.create! #valid_attributes
      expect(match.score).to be(nil)
    end
    it "expect score to have a value" do
      match = Match.all.sample
      expect(match.score).to_not be(nil)
    end
  end
end
