require 'administer/fields'

module Administer
  class Model
    
    @@models = []
    
    def self.all
      if @@models.empty?
        Dir[Rails.root.join('app/models/**/*.rb')].each do |path|
          # TODO: Is it better to get model name from its class definition within model file?
          model_name = path.split('/').last.gsub(/\.rb$/, '')
          @@models << Administer::Model.lookup(model_name)
        end
      end
      @@models
    end
    
    def self.lookup(model_name)
      model_name.camelize.constantize
    end
        
    def self.for(model_name)
      Model.new(lookup(model_name))
    end
    
    attr_accessor :entity
    
    def initialize(model_name)
      @entity = model_name
    end
    
    include Administer::Fields
  end
end
