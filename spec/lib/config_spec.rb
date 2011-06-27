require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Administer::Config do
  describe :configure do
    it "should assign class variable @@config" do
      Administer::Config.should_receive(:new).and_return("the config")
      Administer::Config.configure
      Administer::Config.class_variable_get(:@@config).should == "the config"
    end

    describe "after defining configuration for particular model" do
      before(:each) do
        Administer::Config.configure do
          model Post do
            display_name :title
          end
        end
      end

      it "should be possible to get this configuration" do
        Administer::Config.for(Post).should_not be_nil
      end

      it "should have defined values" do
        Administer::Config.for(Post).display_name.should == :title
      end
    end
  end
end
