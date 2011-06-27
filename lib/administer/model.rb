require 'administer/fields'

module Administer
  class Model
    @@models = []

    class << self
      def all
        if @@models.empty?
          Rails.application.paths.app.models.paths.each do |models_path|
            Dir[File.expand_path("**/*.rb", models_path)].each do |path|
              model_name = path.split('/').last.gsub(/\.rb$/, '')
              @@models << Administer::Model.for(model_name)
            end
          end
        end
        @@models
      end

      def for(model_name)
        klass = model_name.is_a?(Class) ? model_name : lookup(model_name)
        Model.new(klass)
      end

      private
      def lookup(model_name)
        model_name.camelize.constantize
      end
    end

    attr_accessor :entity

    def initialize(model_class)
      @entity = model_class
      @config = Administer::Config.for(@entity)
    end

    def display_for_association(object)
      display_function = @config.association_display
      if display_function.is_a? Symbol
        object.send(display_function)
      else
        object.instance_eval(display_function)
      end
    end

    include Administer::Fields
  end
end
