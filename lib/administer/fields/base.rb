module Administer
  module Fields
    class Base
      attr_reader :name
      def initialize(name)
        @name = name
      end

      def partial
        partial_name = self.class.to_s.underscore.split("/")[-1]
        "administer/fields/#{partial_name}"
      end
    end
  end
end
