require 'rails_helper'

RSpec.describe "leagues/show", :type => :view do
  before(:each) do
    @league = assign(:league, League.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
