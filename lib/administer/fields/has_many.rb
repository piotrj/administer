module Administer
  module Fields
    class HasMany < Administer::Fields::Association
      def checked?(object)
        parent.send(name).include?(object)
      end

      def check_box_name
        "#{parent.class.name.downcase}[#{relation_ids}][]"
      end

      def dom_id(object)
        "#{parent.class.name.downcase}_#{relation_ids}_#{object.id}"
      end

      private
      def relation_ids
        "#{name.to_s.singularize}_ids"
      end
    end
  end
end
