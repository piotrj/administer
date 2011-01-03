require 'administer'
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Administer::EntitiesController do
  describe "GET /index" do
    it "should lookup for proper collection" do
      controller.should_receive(:model_class).and_return(Post)
      posts = mock_model(Post)
      Post.should_receive(:all).and_return(posts)
      get :index, :model_name => 'post'
      assigns[:collection].should == posts
    end
  end
end
