module Administer
  class Administer::EntitiesController < ApplicationController
    unloadable
    before_filter :set_model
    before_filter :collection, :only => :index
    before_filter :fields, :only => [:new, :create, :edit, :update]

    def new
      @object = model_class.new
    end

    def create
      @object = model_class.new(params[model_class.model_name.underscore])
      if @object.save
        redirect_to administer_entities_path(:model_name => model_class.model_name)
      else
        render :new
      end
    end

    def edit
      @object = model_class.find(params[:id])
    end

    def update
      @object = model_class.find(params[:id])
      if @object.update_attributes(params[model_class.model_name.underscore])
        redirect_to administer_entities_path(:model_name => model_class.model_name)
      else
        render :edit
      end
    end

    def destroy
      @object = model_class.find(params[:id])
      unless @object.destroy
        flash[:error] = "Could not destroy object."
      end
      redirect_to administer_entities_path(:model_name => model_class.model_name)
    end

    protected
    def model_class
      @model.entity
    end
    helper_method :model_class

    def set_model
      @model = Model.for(params[:model_name])
    end

    def collection
      @collection = model_class.all
    end

    def fields
      @fields = @model.fields
    end
  end
end
