require 'rails_helper'

RSpec.describe "subdevvits/edit", type: :view do
  before(:each) do
    @subdevvit = assign(:subdevvit, Subdevvit.create!(
      name: "MyString",
      description: "MyString"
    ))
  end

  it "renders the edit subdevvit form" do
    render

    assert_select "form[action=?][method=?]", subdevvit_path(@subdevvit), "post" do

      assert_select "input[name=?]", "subdevvit[name]"

      assert_select "input[name=?]", "subdevvit[description]"
    end
  end
end
