module Administer
  class EntitiesController < ApplicationController
    unloadable
    before_filter :set_model
    before_filter :collection, :only => :index
    before_filter :fields, :only => [:new, :create, :edit, :update]

    def new
      @object = model_class.new
    end

    def create
      @object = model_class.new
      handle_has_one
      @object.attributes= @model_params
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
      handle_has_one
      if @object.update_attributes(@model_params)
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

    def handle_has_one
      has_ones = @fields.select{|f| f.is_a? Administer::Fields::HasOne }
      @model_params = params[model_class.model_name.underscore]
      has_ones.each do |o|
        if @model_params[o.foreign_key]
          has_one_id = @model_params.delete(o.foreign_key)
          if has_one_id.present?
            @object.send((o.name.to_s+"=").to_sym, o.association_class.find(has_one_id))
          end
        end
      end
    end
  end
end
