module Administer
  class Config
    class ModelConfigBuilder
      def initialize(&block)
        @model_config = ModelConfig.new
        self.instance_eval(&block)
      end

      def display_name(method_name = nil, &block)
        raise "Provide method_name or block and not both" unless [method_name, block].select(&:present?).count == 1
        @model_config.display_name = method_name || block
      end

      def build
        @model_config
      end
    end

    class ModelConfig
      attr_accessor :display_name
    end
  end
end
