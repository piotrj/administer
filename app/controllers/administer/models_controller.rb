module Administer
  class ModelsController < ApplicationController
    unloadable
    before_filter :collection, :only => :index
    
    protected
    def model_class
      Administer::Model.lookup(params[:model_name])
    end
    helper_method :model_class
    
    def collection
      @collection = model_class.all
    end
  end
end
