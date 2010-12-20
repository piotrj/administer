require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "posts/new.html.haml" do
  before(:each) do
    assign(:post, stub_model(Post,
      :title => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => posts_path, :method => "post" do
      assert_select "input#post_title", :name => "post[title]"
      assert_select "textarea#post_body", :name => "post[body]"
    end
  end
end
