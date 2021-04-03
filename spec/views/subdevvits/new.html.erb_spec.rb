require 'rails_helper'

RSpec.describe "subdevvits/new", type: :view do
  before(:each) do
    assign(:subdevvit, Subdevvit.new(
      name: "MyString",
      description: "MyString"
    ))
  end

  it "renders new subdevvit form" do
    render

    assert_select "form[action=?][method=?]", subdevvits_path, "post" do

      assert_select "input[name=?]", "subdevvit[name]"

      assert_select "input[name=?]", "subdevvit[description]"
    end
  end
end
