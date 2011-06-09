module Administer
  class Config
    def self.configure(&block)
      @@config = Config.new(&block)
    end

    def initialize(&block)
      @model_configs = {}
      self.instance_eval &block
    end

    private
    def define(klass, &block)
      @model_configs[klass.name.to_sym] = ModelConfig.new(&block)
    end
  end

  class ModelConfig
    def initialize(&block)
      self.instance_eval &block
    end

    def association_display(method_name, &block)
      raise "Provide method_name or block and not both" unless [method_name, block].select(&:present?).count == 1
      @association_display = method_name || block
    end
  end
end
