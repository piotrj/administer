require 'spec_helper'

describe Administer::ModelsController do
  describe "GET /index" do
    it "should lookup for proper collection" do
      Administer::Model.should_receive(:lookup).with('post').and_return(Post)
      posts = mock_model(Post)
      Post.should_receive(:all).and_return(posts)
      get :index, :model_name => 'post'
      assigns[:collection].should == posts
    end
  end
end
