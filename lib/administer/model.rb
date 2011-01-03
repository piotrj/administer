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
    
    def fields
      all_fields = @entity.columns.map { |column| 
        {
          :name => column.name, 
          :type => column.type
        } 
      }
        
       visible_fields = all_fields.delete_if{ |field| ["id", "created_at", "updated_at"].any?{ |a| a == field[:name] } }
       visible_fields
    end
  end
end
