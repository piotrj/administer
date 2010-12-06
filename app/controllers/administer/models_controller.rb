module Administer
  class ModelsController < ApplicationController
    unloadable
    before_filter :collection, :only => :index
    
    protected
    def collection
      @collection = Administer::Model.lookup(params[:model_name]).all
    end
  end
end
