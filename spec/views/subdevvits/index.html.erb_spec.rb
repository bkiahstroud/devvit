require 'rails_helper'

RSpec.describe "subdevvits/index", type: :view do
  before(:each) do
    assign(:subdevvits, [
      Subdevvit.create!(
        name: "Name",
        description: "Description"
      ),
      Subdevvit.create!(
        name: "Name",
        description: "Description"
      )
    ])
  end

  it "renders a list of subdevvits" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
  end
end
