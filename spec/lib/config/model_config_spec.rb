require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')

describe Administer::Config::ModelConfigBuilder do
  before do
    @model_config = mock("model_config")
    Administer::Config::ModelConfig.stub(:new => @model_config)
  end

  describe :display_name do
    it "should be possible to define display_name as block" do
      config_proc = proc{}
      @model_config.should_receive(:display_name=).with(config_proc)

      Administer::Config::ModelConfigBuilder.new do
        display_name &config_proc
      end
    end

    it "should be possible to define display_name as symbol" do
      @model_config.should_receive(:display_name=).with(:method)

      Administer::Config::ModelConfigBuilder.new do
        display_name :method
      end
    end

    it "should raise an exception if both block and metod_name is provided" do
      lambda{
        Administer::Config::ModelConfigBuilder.new do
          display_name :method do end
        end
      }.should raise_error
    end
  end
end
