require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')

describe Administer::Config::ModelConfigBuilder do
  it "should be possibl to define display_name as block" do
    model_config = mock("model_config")
    Administer::Config::ModelConfig.stub(:new => model_config)
    config_proc = proc{}
    model_config.should_receive(:display_name=).with(config_proc)

    Administer::Config::ModelConfigBuilder.new do
      display_name &config_proc
    end
  end
end
