Dir[ File.expand_path("config/**/*.rb", File.dirname(__FILE__))].each { |f| require f }

module Administer
  class Config
    class << self
      def configure(&block)
        @@config = Config.new(&block)
      end

      def for(klass)
        @@config.for(klass) if @@config
      end

      def controller
        @@config.get_instance_variable(:@controller_config)
      end
    end

    def initialize(&block)
      @model_configs = {}
      self.instance_eval &block
    end

    def for(klass)
      @model_configs[klass.to_s.to_sym]
    end

    private
    def model(klass, &block)
      @model_configs[klass.to_s.to_sym] = ModelConfigBuilder.new(&block).build
    end

    def controller(&block)
      @controller_config = ControllerConfigBuilder.new(&block).build
    end
  end
end
