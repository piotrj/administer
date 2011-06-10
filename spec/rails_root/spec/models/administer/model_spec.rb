require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Administer::Model do
  it "should lookup for model given its name" do
    Administer::Model.for('post').entity.should == Post
  end

  it "should return all models defined within ROOT/app/models/, using lookup" do
    pending "test for cases when @@models is empty and not empty"
    Rails.root.should_receive(:join).with('app/models/**/*.rb').and_return('models_path')
    Dir.should_receive(:[]).with('models_path').and_return(['ROOT/app/models/post.rb'])
    Administer::Model.should_receive(:lookup).with('post').and_return('PostStub')
    Administer::Model.all.should == ['PostStub']
  end

end
