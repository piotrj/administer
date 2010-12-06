require 'spec_helper'

describe Administer::ModelsController do
  describe "GET /index" do
    it "should lookup for proper collection" do
      controller.should_receive(:model_class).and_return(Post)
      posts = mock_model(Post)
      Post.should_receive(:all).and_return(posts)
      get :index, :model_name => 'post'
      assigns[:collection].should == posts
    end
  end
  
  it "model_class should lookup for proper model" do
    controller.should_receive(:params).and_return({:model_name => 'Post'})
    Administer::Model.should_receive(:lookup).with('Post').and_return(Post)
    controller.send(:model_class).should == Post
  end
end
