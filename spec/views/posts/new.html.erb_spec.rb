require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      title: "MyString",
      text: "MyText",
      upvotes: 1,
      downvotes: 1
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input[name=?]", "post[title]"

      assert_select "textarea[name=?]", "post[text]"

      assert_select "input[name=?]", "post[upvotes]"

      assert_select "input[name=?]", "post[downvotes]"
    end
  end
end
