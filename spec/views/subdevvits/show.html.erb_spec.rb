require 'rails_helper'

RSpec.describe "subdevvits/show", type: :view do
  before(:each) do
    @subdevvit = assign(:subdevvit, Subdevvit.create!(
      name: "Name",
      description: "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
