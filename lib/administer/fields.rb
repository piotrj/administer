require File.expand_path("fields/base", File.dirname(__FILE__))
require File.expand_path("fields/association", File.dirname(__FILE__))
Dir[ File.expand_path("fields/**/*.rb", File.dirname(__FILE__))].each { |f| require f }
module Administer
  module Fields
    def fields
      all_fields = get_fields_list

      visible_fields = all_fields.delete_if{ |field| ["id", "created_at", "updated_at"].any?{ |a| a == field.name } }
      FieldBuilder.build_fields_for(visible_fields)
    end

    private
    def get_fields_list
      fields = without_belongs_to_keys(@entity.columns)
      fields + reflect_on_all_associations(:belongs_to, :has_many)
    end

    def columns
      @entity.columns.map
    end

    def without_belongs_to_keys(columns)
      belongs_to_keys = @entity.reflect_on_all_associations(:belongs_to).map do |assoc|
        assoc.primary_key_name
      end
      columns.reject { |column| belongs_to_keys.include?(column.name) }
    end
  end
end
