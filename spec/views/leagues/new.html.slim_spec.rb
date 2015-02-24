require 'rails_helper'

RSpec.describe "leagues/new", :type => :view do
  before(:each) do
    assign(:league, League.new())
  end

  it "renders new league form" do
    render

    assert_select "form[action=?][method=?]", leagues_path, "post" do
    end
  end
end
