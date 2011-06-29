module Administer
  module Fields
    class HasOne < Administer::Fields::Association
      attr_reader :foreign_key

      def initialize(name, foreign_key, association_class, parent)
        super(name, association_class, parent)
        @foreign_key = foreign_key
      end

      def select_name
        "#{parent_class.name.downcase}[#{foreign_key}]"
      end

      def dom_id
        "#{parent_class.name.downcase}_#{foreign_key}"
      end

      def options
        [["", nil]] + collection.map{ |object| [display_object(object), object.id] }
      end
    end
  end
end
