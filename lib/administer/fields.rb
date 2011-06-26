require File.expand_path("fields/base", File.dirname(__FILE__))
require File.expand_path("fields/association", File.dirname(__FILE__))
Dir[ File.expand_path("fields/**/*.rb", File.dirname(__FILE__))].each { |f| require f }
module Administer
  module Fields
    def fields
      all_fields = get_fields_list

      visible_fields = all_fields.delete_if{ |field| ["id", "created_at", "updated_at"].any?{ |a| a == field.name } }
      FieldBuilder.new.build_fields_for(visible_fields)
    end

    private
    def get_fields_list
      fields = without_belongs_to_keys(@entity.columns)
      fields + associations(:has_many) + associations(:belongs_to)
    end

    def columns
      @entity.columns
    end

    def without_belongs_to_keys(columns)
      belongs_to_keys = associations(:belongs_to).map do |assoc|
        assoc.primary_key_name
      end
      columns.reject { |column| belongs_to_keys.include?(column.name) }
    end

    def associations(type = nil)
      @entity.reflect_on_all_associations(type)
    end
  end
end
