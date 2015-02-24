require 'rails_helper'

RSpec.describe "leagues/index", :type => :view do
  before(:each) do
    assign(:leagues, [
      League.create!(),
      League.create!()
    ])
  end

  it "renders a list of leagues" do
    render
  end
end
