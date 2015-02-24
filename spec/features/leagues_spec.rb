require 'rails_helper'

describe "Leagues" do
  feature "GET /leagues" do
    it "works! (now write some real specs)" do
      visit leagues_path
      expect(page).to have_http_status(200)
    end

    it "cannot edit league as guest" do
      league = create(:league)
      user = create(:user)
      visit edit_league_path(league)
      expect(page).to have_content("Not authorized")
    end
  end
  
end
