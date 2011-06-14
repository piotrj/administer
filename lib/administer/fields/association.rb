module Administer
  module Fields
    class Association < Administer::Fields::Base
      attr_reader :association_class, :parent, :association_config
      def initialize(name, associaion_class, parent)
        super(name)
        @association_class = association_class
        @parent = parent
        @association_model = Administer::Model.for(@association_class.to_s)
      end

      def collection
        @association_class.all
      end

      def display_object(object)
        @association_model.display_for_association(object)
      end
    end
  end
end
