module Administer
  module Fields
    class FieldBuilder
      @@registered_classes = SuperclassHash.new
      class << self
        def register_class(klass, &block)
          @@registered_classes[klass] = block
        end
      end

      def build_fields_for(fields)
        fields.map do |field|
          field_for(field)
        end
      end

      def field_for(object)
        block = @@registered_classes[object.class]
        raise "FieldBuilder has no class registered #{object.class}" unless block
        block.call(object)
      end
    end
  end
end

