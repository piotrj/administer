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
  
  describe "DELETE /:id" do
    it "should display error message when unable to delete" do
      controller.should_receive(:model_class).twice.and_return(Post)
      post = mock_model(Post, :id => 1, :destroy => false)
      Post.should_receive(:find).and_return(post)
      delete :destroy, :model_name => 'post', :id => 1
      flash[:error].should == "Could not destroy object."
    end
  end
end
