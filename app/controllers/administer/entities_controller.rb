module Administer
  class Administer::EntitiesController < ApplicationController
    unloadable
    before_filter :collection, :only => :index
    before_filter :fields, :only => [:new, :update]
    
    def new
      @object = model_class.new
      logger.info @fields
    end
    
    def create
      @object = model_class.new(params[model_class.model_name.underscore])
      if @object.save
        redirect_to administer_entities_path(:model_name => model_class.model_name)
      else
        render :new
      end
    end
    
    protected
    def model_class
      Administer::Model.lookup(params[:model_name])
    end
    helper_method :model_class
    
    def collection
      @collection = model_class.all
    end
    
    def fields
      @fields = model_class.columns.map(&:name).delete_if{ |name| ["id", "created_at", "updated_at"].any?{ |a| a == name } }
    end
  end
end
