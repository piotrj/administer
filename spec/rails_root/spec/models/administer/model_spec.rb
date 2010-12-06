require 'spec_helper'

describe Administer::Model do
  it "should return all models defined within ROOT/app/models/" do
    Rails.root.should_receive(:join).with('app/models/**/*.rb').and_return('models_path')
    Dir.should_receive(:[]).with('models_path').and_return(['ROOT/app/models/post.rb'])
    Administer::Model.all.should == [Post]
  end
end
