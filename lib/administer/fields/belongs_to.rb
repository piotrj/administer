module Administer
  module Fields
    class BelongsTo < Administer::Fields::Association
      attr_reader :primary_key

      def initialize(name, primary_key, association_class, parent)
        super(name, association_class, parent)
        @primary_key = primary_key
      end
    end
  end
end
