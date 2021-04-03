require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      title: "MyString",
      text: "MyText",
      upvotes: 1,
      downvotes: 1
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input[name=?]", "post[title]"

      assert_select "textarea[name=?]", "post[text]"

      assert_select "input[name=?]", "post[upvotes]"

      assert_select "input[name=?]", "post[downvotes]"
    end
  end
end
