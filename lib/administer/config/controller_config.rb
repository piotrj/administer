module Administer
  class Config
    class ControllerConfigBuilder
      def initialize(&block)
        @controller_config = ControllerConfig.new
        self.instance_eval(&block)
      end

      def build
        @controller_config
      end

      private
      def before_filter(method_name, &block)
        raise "Provide method_name or block and not both" unless [method_name, block].select(&:present?).count == 1
        @controller_config.before_filter = method_name || block
      end
    end

    class ControllerConfig
      attr_accessor :before_filter
    end
  end
end
